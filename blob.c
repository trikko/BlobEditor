#include "ext/raylib/src/raylib.h"
#include "ext/raylib/src/raygui.h"
#include "raymath.h"
#include <stdio.h>
#include <stdlib.h>

#define RLIGHTS_IMPLEMENTATION
#include "rlights.h"

#include "hashmap.h"
#include "opensimplexnoise.h"

int screen_w = 640;
int screen_h = 640;

int new_screen_w = 640;
int new_screen_h = 640;

int isPreviewEnabled = 1;
int  selectedLayer = 0;

int smoothEnabled = true;
float noiseSpeed = 0.5;
float modelSpeed = 0.5;

float noiseStrength = 0.5;
float noiseResolution = 0.5;

float zoom = -4;

Mesh mesh;

void emscripten_run_script(const char *script);
void emscripten_set_main_loop(void (*func)(), int fps, int simulate_infinite_loop);

Camera  camera;
Shader  shader;
Light   light;
Model   model;

Color colors[] =
{
    (Color){240,240,240},
    (Color){204,178,25},
    (Color){164,10,10},
    (Color){25,204,50},
    (Color){25,178,204},
    (Color){204,25,178},
    (Color){50,25,204},
    (Color){30,30,30}
};

size_t colorIndex = 0;
struct osn_context *noise = NULL;

void resize(int w, int h)
{
    new_screen_w = w;
    new_screen_h = h;
}

void smooth(Mesh mesh, int enabled);
void UpdateDrawFrame();


int main()
{
    open_simplex_noise(GetRandomValue(INT32_MIN, INT32_MAX), &noise);

    SetConfigFlags(FLAG_WINDOW_RESIZABLE);
    InitWindow(screen_w, screen_h, "Vasaro");
    resize(screen_w, screen_h);

    // Init resources
    // Camera is fixed
	camera = (Camera)
	{
		(Vector3){0,2,5}, 		// It is placed away from center
		(Vector3){0, -0.5f, 0.0f},  // Watching the center of the object
		(Vector3){0.0f, 1.0f, 0.0f}	// Up direction
		,45.0f, CAMERA_PERSPECTIVE
    };

	// It should be enaugh
	SetTargetFPS(60);

	// Light effect shader
	shader = LoadShader("resources/lightning.vs","resources/lightning.fs");

    // Shader setup
    shader.locs[SHADER_LOC_MATRIX_MODEL] = GetShaderLocation(shader, "matModel");
    shader.locs[SHADER_LOC_VECTOR_VIEW] = GetShaderLocation(shader, "viewPos");

    float shaderValue[] = { 0.5f, 0.5f, 0.5f, 1.0f };

	int ambientLoc = GetShaderLocation(shader, "ambient");
    SetShaderValue(shader, ambientLoc, shaderValue, SHADER_UNIFORM_VEC4);

	// Just one light.
	light = CreateLight(LIGHT_POINT, (Vector3){6, 10, 10}, (Vector3){0, 0, 0}, (Color){255,255,255,255}, shader);

	// Two models available
    model = LoadModel("resources/icosphere.obj");
    model.materials[0].shader = shader;
    mesh = model.meshes[0];

    smooth(mesh, smoothEnabled);

    GuiLoadStyle("resources/style.rgs");

    emscripten_run_script("update_canvas_size();");
    emscripten_set_main_loop(UpdateDrawFrame, 0, 1);

    CloseWindow();        // Close window and OpenGL context

    open_simplex_noise_free(noise);
    return 0;
}

void updateModel()
{
/*
    static double wA = 0;
    wA += GetFrameTime()*1.5;
 */
    static double w = 0;
    w += GetFrameTime()*(0.5+noiseSpeed*3);

    // Distort mesh
    for(size_t idx = 0; idx < mesh.vertexCount; ++idx)
    {
        float* c = &mesh.vertices[3*idx];

        Vector3 v = Vector3Normalize((Vector3){c[0], c[1], c[2]});

        double res = noiseResolution*1.0+0.8;

        double val = 0.6*(noiseStrength*1.0+0.2)*open_simplex_noise4(noise, v.x*res, v.y*res, v.z*res, w);
        val += 1;
        c[0] = v.x*val;
        c[1] = v.y*val;
        c[2] = v.z*val;

    }

    UpdateMeshBuffer(mesh, 0, mesh.vertices, mesh.vertexCount*sizeof(float)*3, 0);
}

void UpdateDrawFrame()
{

    // First check: resize window if needed
    if (IsWindowResized() || new_screen_w != screen_w ||new_screen_h != screen_h)
    {
        screen_w = new_screen_w;
        screen_h = new_screen_h;
        SetWindowSize(screen_w, screen_h);
    }

    // Object rotates randomly
    static double wA = 0;
    wA += GetFrameTime()*(modelSpeed*3);

    Vector3 rotationAxis;
    rotationAxis.x = -1+open_simplex_noise2(noise, wA,2);
    rotationAxis.y = -1+open_simplex_noise2(noise, wA,25);
    rotationAxis.z = -1+open_simplex_noise2(noise, wA,30);

    model.transform = QuaternionToMatrix(QuaternionFromAxisAngle(Vector3Normalize(rotationAxis), 0.5*wA));
    updateModel();
    smooth(model.meshes[0], smoothEnabled);

    // Update view
    {
        Vector2 scroll = GetMouseWheelMoveV();

        zoom += scroll.y*0.5;

        if (zoom > 0) zoom = 0;
        else if (zoom < -7) zoom = -7;

        camera.position.z =  10+zoom;
        /*
        camera.position = (Vector3){ 5*cos(DEG2RAD*modelRotationX), cameraHeight,sin(DEG2RAD*modelRotationX)*5};
        light.position = (Vector3){ 5*cos(DEG2RAD*(modelRotationX-30)), cameraHeight+2,sin(DEG2RAD*(-30+modelRotationX))*5};
        */

        UpdateCamera(&camera);

        // Update shader
        float cameraPos[] = { camera.position.x, camera.position.y, camera.position.z };
        SetShaderValue(shader, shader.locs[SHADER_LOC_VECTOR_VIEW], cameraPos, SHADER_UNIFORM_VEC3);

        // Update light
        UpdateLightValues(shader, light);
    }

    BeginDrawing();

        ClearBackground((Color){25, 46,61, 255});

        // Draw UI

        {
            BeginMode3D(camera);
            DrawModel(model, (Vector3){0,0,0}, 1, colors[colorIndex]);
            EndMode3D();
        }

        // --- ACTIONS
        const int GUI_SPACING = 15;
        const int POPUP_HEIGHT = 24 + GUI_SPACING*3 + 30*2;
        const int POPUP_TOP = screen_h - GUI_SPACING - POPUP_HEIGHT;

        // Rendering
        GuiWindowBox((Rectangle){GUI_SPACING, POPUP_TOP, 180, POPUP_HEIGHT}, "#198# RENDERING");
        smoothEnabled = GuiToggle((Rectangle){GUI_SPACING*2, POPUP_TOP + 24 + GUI_SPACING, 180-15*2, 30}, "#12# SMOOTH MODEL", smoothEnabled);
        colorIndex = GuiComboBox((Rectangle){GUI_SPACING*2, POPUP_TOP + 24 + GUI_SPACING*2 + 30, 180-15*2, 30},"WHITE;YELLOW;RED;GREEN;CYAN;MAGENTA;LILAC;GRAY",colorIndex);
        /*
        if (GuiButton((Rectangle){GUI_SPACING*2, POPUP_TOP + 24 + GUI_SPACING*2 + 30, 180-15*2, 30}, "#2# CHANGE COLOR"))
            colorIndex = (colorIndex+1)%8;
 */
        // Noise
        const int NOISE_LEFT = GUI_SPACING*2+180;
        GuiWindowBox((Rectangle){NOISE_LEFT, POPUP_TOP, 180+70, POPUP_HEIGHT}, "#198# SPEEDS");
        noiseSpeed = GuiSlider((Rectangle){NOISE_LEFT + GUI_SPACING +70, POPUP_TOP + 24 + GUI_SPACING, 180-15*2, 30}, "NOISE: ", "", noiseSpeed, 0, 1);
        modelSpeed = GuiSlider((Rectangle){NOISE_LEFT + GUI_SPACING +70, POPUP_TOP + 24 + GUI_SPACING*2 + 30, 180-15*2, 30}, "ROTATION: ", "", modelSpeed, 0, 1);

        // Noise
        const int AXIS_LEFT = NOISE_LEFT + GUI_SPACING*2 + 70 + 180 - 15;
        GuiWindowBox((Rectangle){AXIS_LEFT , POPUP_TOP, 180+70, POPUP_HEIGHT}, "#198# NOISE");
        noiseStrength = GuiSlider((Rectangle){AXIS_LEFT+ GUI_SPACING +70, POPUP_TOP + 24 + GUI_SPACING, 180-15*2, 30}, "STRENGTH: ", "", noiseStrength, 0, 1);
        noiseResolution = GuiSlider((Rectangle){AXIS_LEFT+ GUI_SPACING +70, POPUP_TOP + 24 + GUI_SPACING*2 +30, 180-15*2, 30}, "DETAILS: ", "", noiseResolution, 0, 1);
        //noiseZ = GuiSlider((Rectangle){AXIS_LEFT+ GUI_SPACING +70, POPUP_TOP + 24 + GUI_SPACING*2 + 30, 180-15*2, 30}, "Z: ", "", noiseZ, 0, 1);



        // VISIBLE

        // INVISIBLE

        //DrawText(s, 190, 200, 20, (Color){200,200,100,100});

    EndDrawing();
    //----------------------------------------------------------------------------------
}

typedef struct {
    Vector3 key;
    Vector3 value;
} V3KeyValue;

int v3_hashmap_compare(const void *a, const void *b, void *udata) {
    const V3KeyValue *ua = a;
    const V3KeyValue *ub = b;
    return !(ua->key.x == ub->key.x && ua->key.y == ub->key.y && ua->key.z == ub->key.z);
}

uint64_t v3_hashmap_hash(const void *item, uint64_t seed0, uint64_t seed1) {
    const V3KeyValue *ua = item;
    float toHash[] = {ua->key.x, ua->key.y, ua->key.z};
    return hashmap_sip(toHash, sizeof(float)*3, seed0, seed1);
}

void smooth(Mesh mesh, int enabled)
{
    struct hashmap *linkedNormals;

    if (enabled)
        linkedNormals = hashmap_new(sizeof(V3KeyValue), 0, 0, 0, v3_hashmap_hash, v3_hashmap_compare, NULL, NULL);

	//size_t idx = 0;
    for(size_t idx = 0; idx < mesh.vertexCount * 3; idx+=9 )
	{
        float *tri = &(mesh.vertices[idx]);

        Vector3 v1 = (Vector3){tri[0], tri[1], tri[2]};
        Vector3 v2 = (Vector3){tri[3], tri[4], tri[5]};
        Vector3 v3 = (Vector3){tri[6], tri[7], tri[8]};

		Vector3 normalV1 = Vector3CrossProduct((Vector3Subtract(v2,v1)), Vector3Subtract(v3,v1));
		Vector3 normalV2 = Vector3CrossProduct((Vector3Subtract(v3,v2)), Vector3Subtract(v1,v2));
		Vector3 normalV3 = Vector3CrossProduct((Vector3Subtract(v1,v3)), Vector3Subtract(v2,v3));

		Vector3 sum = Vector3Add(Vector3Add(normalV1, normalV2), normalV3);


		if (enabled)
		{
			{
				V3KeyValue *item = hashmap_get(linkedNormals, &(V3KeyValue){ v1 });
				if (item == NULL) hashmap_set(linkedNormals, &(V3KeyValue){ v1, sum });
				else
                {
                    hashmap_set(linkedNormals, &(V3KeyValue){ v1, Vector3Add(item->value, sum) });
                }
			}

			{
				V3KeyValue *item = hashmap_get(linkedNormals, &(V3KeyValue){ v2 });
				if (item == NULL) hashmap_set(linkedNormals, &(V3KeyValue){ v2, sum });
				else
                {
                    hashmap_set(linkedNormals, &(V3KeyValue){ v2, Vector3Add(item->value, sum) });
                }
			}

			{
				V3KeyValue *item = hashmap_get(linkedNormals, &(V3KeyValue){ v3 });
				if (item == NULL) hashmap_set(linkedNormals, &(V3KeyValue){ v3, sum });
				else
                {
                    hashmap_set(linkedNormals, &(V3KeyValue){ v3, Vector3Add(item->value, sum) });
                }
			}
		}

		else

		{
			Vector3 norm = Vector3Normalize(sum);

			for(int k = 0; k < 3; ++k)
            {
				mesh.normals[idx + k*3 + 0] = norm.x;
                mesh.normals[idx + k*3 + 1] = norm.y;
                mesh.normals[idx + k*3 + 2] = norm.z;
            }

		}

	}


	if(enabled)
	{
/*
		size_t iter = 0;
        void *item;
        while (hashmap_iter(linkedNormals, &iter, &item)) {
            V3KeyValue *v = item;
            v->value = Vector3Normalize(v->value);
        }
*/

        for(size_t idx = 0; idx < mesh.vertexCount * 3; idx+=3 )
        {
            float *v = &(mesh.vertices[idx]);

            V3KeyValue *item = hashmap_get(linkedNormals, &(V3KeyValue){ (Vector3){v[0], v[1], v[2]} });
            Vector3 norm = Vector3Normalize(item->value);

            mesh.normals[idx+0] = norm.x;
            mesh.normals[idx+1] = norm.y;
            mesh.normals[idx+2] = norm.z;
        }


        hashmap_free(linkedNormals);
	}

	// Update normals
	//rlUpdateMesh(mesh, 2, mesh.vertexCount);
    UpdateMeshBuffer(mesh, 2, mesh.normals, mesh.vertexCount*3*sizeof(float), 0);
}


//void _start() { }
