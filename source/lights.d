// Taken from raylib examples

module lights;

import raylib;

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
static immutable        MAX_LIGHTS     =       4;      // Max lights supported by shader
static immutable        LIGHT_DISTANCE  =      3.5f;      // Light distance from world center
static immutable          LIGHT_HEIGHT   =     1.0f;      // Light height position

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
enum LightType {
    LIGHT_DIRECTIONAL,
    LIGHT_POINT
}

struct Light {
    bool enabled;
    LightType type;
    Vector3 position;
    Vector3 target;
    Color color;
    int enabledLoc;
    int typeLoc;
    int posLoc;
    int targetLoc;
    int colorLoc;
} 

//----------------------------------------------------------------------------------
// Module specific Functions Declaration
//----------------------------------------------------------------------------------
// ...

//----------------------------------------------------------------------------------
// Module Functions Definition
//----------------------------------------------------------------------------------
__gshared int lightsCount = 0;

// Defines a light and get locations from PBR shader
Light CreateLight(LightType type, Vector3 pos, Vector3 targ, Color color, Shader shader)
{
    Light light;

    
    {
        light.enabled = true;
        light.type = type;
        light.position = pos;
        light.target = targ;
        light.color = color;

        import std.format : format;
        import std.string : toStringz;

        auto enabledName = format("lights[%s].enabled", lightsCount);
        auto typeName = format("lights[%s].type", lightsCount);
        auto posName = format("lights[%s].position", lightsCount);
        auto targetName = format("lights[%s].target", lightsCount);
        auto colorName = format("lights[%s].color", lightsCount);

        light.enabledLoc = GetShaderLocation(shader, enabledName.toStringz);
        light.typeLoc = GetShaderLocation(shader, typeName.toStringz);
        light.posLoc = GetShaderLocation(shader, posName.toStringz);
        light.targetLoc = GetShaderLocation(shader, targetName.toStringz);
        light.colorLoc = GetShaderLocation(shader, colorName.toStringz);

        UpdateLightValues(shader, light);
        lightsCount++;
        return light;
    }
}

// Send to PBR shader light values
void UpdateLightValues(Shader shader, Light light)
{
    // Send to shader light enabled state and type
    SetShaderValue(shader, light.enabledLoc, &(light.enabled), ShaderUniformDataType.UNIFORM_INT);
    SetShaderValue(shader, light.typeLoc, &(light.type), ShaderUniformDataType.UNIFORM_INT);

    // Send to shader light position values
    float[] position = [ light.position.x, light.position.y, light.position.z ];
    SetShaderValue(shader, light.posLoc, position.ptr, ShaderUniformDataType.UNIFORM_VEC3);

    // Send to shader light target position values
    float[] target = [ light.target.x, light.target.y, light.target.z ];
    SetShaderValue(shader, light.targetLoc, target.ptr, ShaderUniformDataType.UNIFORM_VEC3);

    // Send to shader light color values
    float[] diff = [ cast(float)light.color.r/cast(float)255, cast(float)light.color.g/cast(float)255, cast(float)light.color.b/cast(float)255, cast(float)light.color.a/cast(float)255 ];
    SetShaderValue(shader, light.colorLoc, diff.ptr, ShaderUniformDataType.UNIFORM_VEC4);
}