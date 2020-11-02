import std;
import raylib;
import lights;
import opensimplexnoise;
import vec3;

// Noise generator!
OpenSimplexNoise!float sn;

void main()
{
	// Colors for the blob
	immutable colors = 
	[
		Color(164,10,10),
		Color(204,178,25),
		Color(25,204,50),
		Color(25,178,204),
		Color(204,25,178),
		Color(50,25,204),
		Color(30,30,30),
		cast(Color)(Colors.RAYWHITE),	
	];

	// Used to create an organic noise
	sn =  new OpenSimplexNoise!float(uniform(long.min, long.max));
	
	// Init main window
	SetConfigFlags(ConfigFlag.FLAG_MSAA_4X_HINT);
	InitWindow(800, 600, "Blob Editor");
	
	// Camera is fixed
	Camera camera = Camera
	(
		Vector3(2.5,10,10), 		// It is placed away from center
		Vector3(2.5f, 0.0f, 0.0f),  // Watching the center of the object
		Vector3( 0.0f, 1.0f, 0.0f)	// Up direction
		,45.0f, CameraType.CAMERA_PERSPECTIVE
	);

	// It should be enaugh
	SetTargetFPS(60);   

	// Light effect shader
	Shader shader = LoadShader("assets/base_lighting.vs".toStringz,"assets/lighting.fs".toStringz);
    
    // Shader setup
    shader.locs[ShaderLocationIndex.LOC_MATRIX_MODEL] = GetShaderLocation(shader, "matModel".toStringz);
    shader.locs[ShaderLocationIndex.LOC_VECTOR_VIEW] = GetShaderLocation(shader, "viewPos".toStringz);

	int ambientLoc = GetShaderLocation(shader, "ambient".toStringz);
    SetShaderValue(shader, ambientLoc, [ 0.5f, 0.5f, 0.5f, 1.0f ].ptr, ShaderUniformDataType.UNIFORM_VEC4);
    
	// Just one light.
	Light light = CreateLight(LightType.LIGHT_POINT, Vector3(6, 10, 10), Vector3Zero, Colors.WHITE, shader);
	
	// Two models available
	Model pModelPlane = LoadModel("assets/plane.obj");
	Model pModelSphere = LoadModel("assets/icosphere.obj");
	
	// Model currently rendered
	Model pModel;
	Mesh pMesh;
	
	// Should I load model again? (when model is changed)
	bool reloadModel = true;

	// Object rotates around this axis
	Vector3 rotationAxis;

	// Used for animation
	float frameCnt = 0;
	
	// Some params you can tweak with interface
   	float w = 0;
	float wA = 0;
	
	float resX = 2.5;
	float resY = 1.5;
	float resZ = 1.5;
	float amplitude = 1;
	float speed = 0.03;

	bool isGrid = false;
	bool smooth = false;

	size_t currentColor = uniform(0, colors.length);

	while (!WindowShouldClose()) 
	{
		if (reloadModel)
		{
			if (isGrid) pModel = pModelPlane;
			else pModel = pModelSphere;
			
			pMesh = pModel.meshes[0];
			pModel.materials[0].shader = shader;

			reloadModel = false;
		}

		if (!isGrid)
		{
			// Object rotates randomly
			rotationAxis.x = -1+sn.eval(wA,2);
			rotationAxis.y = -1+sn.eval(wA,25);
			rotationAxis.z = -1+sn.eval(wA,30);
		}
		else 
		{
			// Grid rotates around vertical axis
			rotationAxis.x = 0;
			rotationAxis.y = 1;
			rotationAxis.z = 0;
		}

		// Update camera
		UpdateCamera(&camera);

		// Update shader
		float[3] cameraPos = [ camera.position.x, camera.position.y, camera.position.z ];
        SetShaderValue(shader, shader.locs[ShaderLocationIndex.LOC_VECTOR_VIEW], cameraPos.ptr, ShaderUniformDataType.UNIFORM_VEC3);
        
		// Update light
		UpdateLightValues(shader, light);
        
		// Every 1000 frames the model will do a complete rotation
		frameCnt = (frameCnt+1)%1000;
		
		// Distort mesh
		foreach(idx; 0..pMesh.vertexCount)
		{	
			float[] c = pMesh.vertices[3*idx..3*(idx+1)];
			
			if (isGrid)	c[1] = amplitude*sn.eval(c[0]*resX,c[2]*resZ,w);
			else 
			{
				Vec3 v = Vec3(c[0..3]);
				v.normalize();
				
				auto val = 3+amplitude*sn.eval(v.x*resX,v.y*resY,v.z*resZ,w);
				v.data[] *= val;
				c[0..3] = v.data[0..3];	
			}
		}	

		rlUpdateMesh(pMesh,0,pMesh.vertexCount);
		
		// Smooth mesh
		Smooth(pMesh, smooth);

		{
			BeginDrawing(); scope(exit) EndDrawing();
			
			// Background
			ClearBackground(Color(25, 46,61));
			
			// Model
			{
				BeginMode3D(camera); scope(exit) EndMode3D();
				if (isGrid)DrawModelWiresEx(pModel, Vector3(0,0,0), rotationAxis, frameCnt/1000.0f*360.0f, Vector3(1,1,1), colors[currentColor]);
				else DrawModelEx (pModel, Vector3(0,0,0), rotationAxis, frameCnt/1000.0f*360, Vector3(1,1,1), colors[currentColor]);
			}

			// Controls
			DrawRectangle(580,0,220,800, Colors.RAYWHITE);
			DrawText(TextFormat("RUNNING AT %2i FPS", GetFPS()), 10, 580, 10, Colors.RAYWHITE);
			
			size_t space = 10;

			const lastVal = isGrid;
			isGrid ^= GuiButton(Rectangle(600, space+=35, 180,20), isGrid?"SWITCH TO SPHERE":"SWITCH TO PLANE");
			reloadModel = isGrid != lastVal;

			if (GuiButton(Rectangle(600, space+=35, 180,20), "CHANGE COLOR"))
				currentColor = (currentColor + 1) % colors.length;

			smooth = GuiCheckBox(Rectangle(600, space+=35, 20,20), "SMOOTH MODEL", smooth);

			GuiLabel(Rectangle(600,space+=35,180,20), "FREQUENCY");

			resX = GuiSlider(Rectangle(620,space+=30,160,20), "X  ", null, resX, 0,2.5);

			if(isGrid) GuiDisable();
			resY=GuiSlider(Rectangle(620,space+=30,160,20), "Y  ", null, resY, 0,2.5);
			if(isGrid) GuiEnable();
		
			resZ = GuiSlider(Rectangle(620,space+=30,160,20), "Z  ", null, resZ, 0,2.5);

			GuiLabel(Rectangle(600,space+=35,80,20), "AMPLITUDE");
			amplitude = GuiSlider(Rectangle(600,space+=30,180,20), null, null, amplitude, 0.1, 2);

			GuiLabel(Rectangle(600,space+=35,80,20), "INTENSITY");
			speed = GuiSlider(Rectangle(600,space+=30,180,20), null, null, speed, 0.005, 0.08);

		}

		w	+=	speed;
		wA 	+= 0.01;
	}

}


void Smooth(ref Mesh mesh, bool enabled=true)
{
	import containers;
	HashMap!(Vec3, Vec3) linkedNormals = HashMap!(Vec3, Vec3)(16);
	
	size_t idx = 0;
	foreach(ref tri; mesh.vertices[0..mesh.vertexCount*3].chunks(9))
	{
		Vec3 v1 = Vec3(tri[0..3]);
		Vec3 v2 = Vec3(tri[3..6]);
		Vec3 v3 = Vec3(tri[6..9]);

		Vec3 normalV1 = (v2-v1).crossProduct(v3-v1);
		Vec3 normalV2 = (v3-v2).crossProduct(v1-v2);
		Vec3 normalV3 = (v1-v3).crossProduct(v2-v3);

		Vec3 sum = normalV1 + normalV2 + normalV3;
		
		if (enabled)
		{			
			{
				auto item = v1 in linkedNormals;
				if (!item) linkedNormals[v1] = Vec3(sum.data[]);
				else *item += sum;
			}

			{
				auto item = v2 in linkedNormals;
				if (!item) linkedNormals[v2] = Vec3(sum.data[]);
				else *item += sum;
			}
			
			{
				auto item = v3 in linkedNormals;
				if (!item) linkedNormals[v3] = Vec3(sum.data[]);
				else *item += sum;
			}
		}
		else 
		{
			sum.normalize();
			foreach(k;0..3)
				mesh.normals[idx + k*3 + 0 .. idx + k*3 + 3] = sum.data[0..3];
			
		}

		idx+=9;
	}

	if(enabled)
	{

		foreach(ref l; linkedNormals) l.normalize();

		idx = 0;
		foreach(ref v; mesh.vertices[0..mesh.vertexCount*3].chunks(3))
		{
			auto nor = &linkedNormals[Vec3(v[0..3])];
			mesh.normals[idx + 0 .. idx + 3] = nor.data[0..3];
			idx += 3;
		}	
	}

	// Update normals
	rlUpdateMesh(mesh, 2, mesh.vertexCount);
}