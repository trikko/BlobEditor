/*******************************************************************************************
*
*   raylib.camera - Camera system with multiple modes support
*
*   NOTE: Memory footprint of this library is aproximately 52 bytes (global variables)
*
*   CONFIGURATION:
*
*   #define CAMERA_IMPLEMENTATION
*       Generates the implementation of the library into the included file.
*       If not defined, the library is in header only mode and can be included in other headers
*       or source files without problems. But only ONE file should hold the implementation.
*
*   #define CAMERA_STANDALONE
*       If defined, the library can be used as standalone as a camera system but some
*       functions must be redefined to manage inputs accordingly.
*
*   CONTRIBUTORS:
*       Ramon Santamaria:   Supervision, review, update and maintenance
*       Marc Palau:         Initial implementation (2014)
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2015-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

extern (C):

import core.stdc.stdlib;
import std.math : PI;

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
//...

//----------------------------------------------------------------------------------
// Types and Structures Definition
// NOTE: Below types are required for CAMERA_STANDALONE usage
//----------------------------------------------------------------------------------

// Vector2 type

// Vector3 type

// Camera type, defines a camera position/orientation in 3d space

// Camera position
// Camera target it looks-at
// Camera up vector (rotation over its axis)
// Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
// Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC

// Camera type fallback, defaults to Camera3D

// Camera system modes

// Camera projection modes

// Prevents name mangling of functions

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------
//...

//----------------------------------------------------------------------------------
// Module Functions Declaration
//----------------------------------------------------------------------------------

// Set camera mode (multiple camera modes available)
// Update camera position for selected mode

// Set camera pan key to combine with mouse movement (free camera)
// Set camera alt key to combine with mouse movement (free camera)
// Set camera smooth zoom key to combine with mouse (free camera)

// Set camera move controls (1st person and 3rd person cameras)

// CAMERA_H

/***********************************************************************************
*
*   CAMERA IMPLEMENTATION
*
************************************************************************************/

// Required for: sinf(), cosf(), sqrtf()

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
// Camera mouse movement sensitivity

// FREE_CAMERA

// ORBITAL_CAMERA
// Radians per frame

// FIRST_PERSON
//#define CAMERA_FIRST_PERSON_MOUSE_SENSITIVITY           0.003f

// THIRD_PERSON
//#define CAMERA_THIRD_PERSON_MOUSE_SENSITIVITY           0.003f

// PLAYER (used by camera)

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
// Camera move modes (first person and third person cameras)

// Camera global state context data

// Current camera mode
// Camera distance from position to target
// Default player eyes position from ground (in meters)
// Camera angle in plane XZ

// raylib: KEY_LEFT_CONTROL
// raylib: KEY_LEFT_ALT
// raylib: MOUSE_MIDDLE_BUTTON

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------
// Global CAMERA state context

//----------------------------------------------------------------------------------
// Module specific Functions Declaration
//----------------------------------------------------------------------------------

// NOTE: Camera controls depend on some raylib input functions
// Unlock cursor
// Lock cursor

//----------------------------------------------------------------------------------
// Module Functions Definition
//----------------------------------------------------------------------------------

// Select camera mode (multiple camera modes available)

// Camera angle calculation
// Camera angle in plane XZ (0 aligned with Z, move positive CCW)
// Camera angle in plane XY (0 aligned with X, move positive CW)

// Lock cursor for first person and third person cameras

// Update camera depending on selected mode
// NOTE: Camera controls depend on some raylib functions:
//       System: EnableCursor(), DisableCursor()
//       Mouse: IsMouseButtonDown(), GetMousePosition(), GetMouseWheelMove()
//       Keys:  IsKeyDown()
// TODO: Port to quaternion-based camera (?)

// Used for 1st person swinging movement

// TODO: Compute CAMERA.targetDistance and CAMERA.angle here (?)

// Mouse movement detection

// Keys input detection

// TODO: Touch input detection (probably gestures system required)

// Support for multiple automatic camera modes
// NOTE: In case of CAMERA_CUSTOM nothing happens here, user must update it manually

// Camera free controls, using standard 3d-content-creation scheme

// Camera zoom

// Camera looking down
// TODO: Review, weird comparison of CAMERA.targetDistance == 120.0f?

// if (camera->target.y < 0) camera->target.y = -0.001;

// Camera looking up
// TODO: Review, weird comparisson of CAMERA.targetDistance == 120.0f?

// if (camera->target.y > 0) camera->target.y = 0.001;

// Input keys checks

// Alternative key behaviour

// Camera smooth zoom

// Camera rotation

// Angle clamp

// Camera panning

// Update camera position with changes

// Camera just orbits around target, only zoom allowed

// Camera orbit angle
// Camera zoom

// Camera distance clamp

// Update camera position with changes

// Camera moves as in a first-person game, controls are configurable

// Camera orientation calculation

// Angle clamp

// Recalculate camera target considering translation and rotation

// If movement detected (some key pressed), increase swinging

// Camera position update
// NOTE: On CAMERA_FIRST_PERSON player Y-movement is limited to player 'eyes position'

// Camera moves as in a third-person game, following target at a distance, controls are configurable

// Camera orientation calculation

// Angle clamp

// Camera zoom

// Camera distance clamp

// TODO: It seems camera->position is not correctly updated or some rounding issue makes the camera move straight to camera->target...

// Set camera pan key to combine with mouse movement (free camera)

// Set camera alt key to combine with mouse movement (free camera)

// Set camera smooth zoom key to combine with mouse (free camera)

// Set camera move controls (1st person and 3rd person cameras)

// CAMERA_IMPLEMENTATION
/**********************************************************************************************
*
*   raudio - A simple and easy-to-use audio library based on miniaudio
*
*   FEATURES:
*       - Manage audio device (init/close)
*       - Load and unload audio files
*       - Format wave data (sample rate, size, channels)
*       - Play/Stop/Pause/Resume loaded audio
*       - Manage mixing channels
*       - Manage raw audio context
*
*   DEPENDENCIES:
*       miniaudio.h  - Audio device management lib (https://github.com/dr-soft/miniaudio)
*       stb_vorbis.h - Ogg audio files loading (http://www.nothings.org/stb_vorbis/)
*       dr_mp3.h     - MP3 audio file loading (https://github.com/mackron/dr_libs)
*       dr_flac.h    - FLAC audio file loading (https://github.com/mackron/dr_libs)
*       jar_xm.h     - XM module file loading
*       jar_mod.h    - MOD audio file loading
*
*   CONTRIBUTORS:
*       David Reid (github: @mackron) (Nov. 2017):
*           - Complete port to miniaudio library
*
*       Joshua Reisenauer (github: @kd7tck) (2015)
*           - XM audio module support (jar_xm)
*           - MOD audio module support (jar_mod)
*           - Mixing channels support
*           - Raw audio context support
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2014-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

extern (C):

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
// Allow custom memory allocators

alias RL_MALLOC = malloc;

alias RL_CALLOC = calloc;

alias RL_FREE = free;

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------


// Wave type, defines audio wave data
struct Wave
{
    uint sampleCount; // Total number of samples
    uint sampleRate; // Frequency (samples per second)
    uint sampleSize; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    uint channels; // Number of channels (1-mono, 2-stereo)
    void* data; // Buffer data pointer
}

struct rAudioBuffer;

// Audio stream type
// NOTE: Useful to create custom audio streams not bound to a specific file
struct AudioStream
{
    uint sampleRate; // Frequency (samples per second)
    uint sampleSize; // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    uint channels; // Number of channels (1-mono, 2-stereo)

    rAudioBuffer* buffer; // Pointer to internal data used by the audio system
}

// Sound source type
struct Sound
{
    uint sampleCount; // Total number of samples
    AudioStream stream; // Audio stream
}

// Music stream type (audio file streaming from memory)
// NOTE: Anything longer than ~10 seconds should be streamed
struct Music
{
    int ctxType; // Type of music context (audio filetype)
    void* ctxData; // Audio context data, depends on type

    uint sampleCount; // Total number of samples
    uint loopCount; // Loops count (times music will play), 0 means infinite loop

    AudioStream stream; // Audio stream
}

// Prevents name mangling of functions

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------
//...

//----------------------------------------------------------------------------------
// Module Functions Declaration
//----------------------------------------------------------------------------------

// Audio device management functions
void InitAudioDevice (); // Initialize audio device and context
void CloseAudioDevice (); // Close the audio device and context
bool IsAudioDeviceReady (); // Check if audio device has been initialized successfully
void SetMasterVolume (float volume); // Set master volume (listener)

// Wave/Sound loading/unloading functions
Wave LoadWave (const(char)* fileName); // Load wave data from file
Sound LoadSound (const(char)* fileName); // Load sound from file
Sound LoadSoundFromWave (Wave wave); // Load sound from wave data
void UpdateSound (Sound sound, const(void)* data, int samplesCount); // Update sound buffer with new data
void UnloadWave (Wave wave); // Unload wave data
void UnloadSound (Sound sound); // Unload sound
void ExportWave (Wave wave, const(char)* fileName); // Export wave data to file
void ExportWaveAsCode (Wave wave, const(char)* fileName); // Export wave sample data to code (.h)

// Wave/Sound management functions
void PlaySound (Sound sound); // Play a sound
void StopSound (Sound sound); // Stop playing a sound
void PauseSound (Sound sound); // Pause a sound
void ResumeSound (Sound sound); // Resume a paused sound
void PlaySoundMulti (Sound sound); // Play a sound (using multichannel buffer pool)
void StopSoundMulti (); // Stop any sound playing (using multichannel buffer pool)
int GetSoundsPlaying (); // Get number of sounds playing in the multichannel
bool IsSoundPlaying (Sound sound); // Check if a sound is currently playing
void SetSoundVolume (Sound sound, float volume); // Set volume for a sound (1.0 is max level)
void SetSoundPitch (Sound sound, float pitch); // Set pitch for a sound (1.0 is base level)
void WaveFormat (Wave* wave, int sampleRate, int sampleSize, int channels); // Convert wave data to desired format
Wave WaveCopy (Wave wave); // Copy a wave to a new wave
void WaveCrop (Wave* wave, int initSample, int finalSample); // Crop a wave to defined samples range
float* GetWaveData (Wave wave); // Get samples data from wave as a floats array

// Music management functions
Music LoadMusicStream (const(char)* fileName); // Load music stream from file
void UnloadMusicStream (Music music); // Unload music stream
void PlayMusicStream (Music music); // Start music playing
void UpdateMusicStream (Music music); // Updates buffers for music streaming
void StopMusicStream (Music music); // Stop music playing
void PauseMusicStream (Music music); // Pause music playing
void ResumeMusicStream (Music music); // Resume playing paused music
bool IsMusicPlaying (Music music); // Check if music is playing
void SetMusicVolume (Music music, float volume); // Set volume for music (1.0 is max level)
void SetMusicPitch (Music music, float pitch); // Set pitch for a music (1.0 is base level)
void SetMusicLoopCount (Music music, int count); // Set music loop count (loop repeats)
float GetMusicTimeLength (Music music); // Get music time length (in seconds)
float GetMusicTimePlayed (Music music); // Get current music time played (in seconds)

// AudioStream management functions
AudioStream InitAudioStream (uint sampleRate, uint sampleSize, uint channels); // Init audio stream (to stream raw audio pcm data)
void UpdateAudioStream (AudioStream stream, const(void)* data, int samplesCount); // Update audio stream buffers with data
void CloseAudioStream (AudioStream stream); // Close audio stream and free memory
bool IsAudioStreamProcessed (AudioStream stream); // Check if any audio stream buffers requires refill
void PlayAudioStream (AudioStream stream); // Play audio stream
void PauseAudioStream (AudioStream stream); // Pause audio stream
void ResumeAudioStream (AudioStream stream); // Resume audio stream
bool IsAudioStreamPlaying (AudioStream stream); // Check if audio stream is playing
void StopAudioStream (AudioStream stream); // Stop audio stream
void SetAudioStreamVolume (AudioStream stream, float volume); // Set volume for audio stream (1.0 is max level)
void SetAudioStreamPitch (AudioStream stream, float pitch); // Set pitch for audio stream (1.0 is base level)
void SetAudioStreamBufferSizeDefault (int size); // Default size for new audio streams

// RAUDIO_H
/**********************************************************************************************
*
*   raylib - A simple and easy-to-use library to enjoy videogames programming (www.raylib.com)
*
*   FEATURES:
*       - NO external dependencies, all required libraries included with raylib
*       - Multiplatform: Windows, Linux, FreeBSD, OpenBSD, NetBSD, DragonFly, MacOS, UWP, Android, Raspberry Pi, HTML5.
*       - Written in plain C code (C99) in PascalCase/camelCase notation
*       - Hardware accelerated with OpenGL (1.1, 2.1, 3.3 or ES2 - choose at compile)
*       - Unique OpenGL abstraction layer (usable as standalone module): [rlgl]
*       - Multiple Fonts formats supported (TTF, XNA fonts, AngelCode fonts)
*       - Outstanding texture formats support, including compressed formats (DXT, ETC, ASTC)
*       - Full 3d support for 3d Shapes, Models, Billboards, Heightmaps and more!
*       - Flexible Materials system, supporting classic maps and PBR maps
*       - Skeletal Animation support (CPU bones-based animation)
*       - Shaders support, including Model shaders and Postprocessing shaders
*       - Powerful math module for Vector, Matrix and Quaternion operations: [raymath]
*       - Audio loading and playing with streaming support (WAV, OGG, MP3, FLAC, XM, MOD)
*       - VR stereo rendering with configurable HMD device parameters
*       - Bindings to multiple programming languages available!
*
*   NOTES:
*       One custom font is loaded by default when InitWindow() [core]
*       If using OpenGL 3.3 or ES2, one default shader is loaded automatically (internally defined) [rlgl]
*       If using OpenGL 3.3 or ES2, several vertex buffers (VAO/VBO) are created to manage lines-triangles-quads
*
*   DEPENDENCIES (included):
*       [core] rglfw (github.com/glfw/glfw) for window/context management and input (only PLATFORM_DESKTOP)
*       [rlgl] glad (github.com/Dav1dde/glad) for OpenGL 3.3 extensions loading (only PLATFORM_DESKTOP)
*       [raudio] miniaudio (github.com/dr-soft/miniaudio) for audio device/context management
*
*   OPTIONAL DEPENDENCIES (included):
*       [core] rgif (Charlie Tangora, Ramon Santamaria) for GIF recording
*       [textures] stb_image (Sean Barret) for images loading (BMP, TGA, PNG, JPEG, HDR...)
*       [textures] stb_image_write (Sean Barret) for image writting (BMP, TGA, PNG, JPG)
*       [textures] stb_image_resize (Sean Barret) for image resizing algorithms
*       [textures] stb_perlin (Sean Barret) for Perlin noise image generation
*       [text] stb_truetype (Sean Barret) for ttf fonts loading
*       [text] stb_rect_pack (Sean Barret) for rectangles packing
*       [models] par_shapes (Philip Rideout) for parametric 3d shapes generation
*       [models] tinyobj_loader_c (Syoyo Fujita) for models loading (OBJ, MTL)
*       [models] cgltf (Johannes Kuhlmann) for models loading (glTF)
*       [raudio] stb_vorbis (Sean Barret) for OGG audio loading
*       [raudio] dr_flac (David Reid) for FLAC audio file loading
*       [raudio] dr_mp3 (David Reid) for MP3 audio file loading
*       [raudio] jar_xm (Joshua Reisenauer) for XM audio module loading
*       [raudio] jar_mod (Joshua Reisenauer) for MOD audio module loading
*
*
*   LICENSE: zlib/libpng
*
*   raylib is licensed under an unmodified zlib/libpng license, which is an OSI-certified,
*   BSD-like license that allows static linking with closed source software:
*
*   Copyright (c) 2013-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

import core.stdc.config;
import core.stdc.stdarg;

extern (C):

// Required for: va_list - Only used by TraceLogCallback

// Microsoft attibutes to tell compiler that symbols are imported/exported from a .dll

// We are building raylib as a Win32 shared library (.dll)

// We are using raylib as a Win32 shared library (.dll)

// We are building or using raylib as a static library // We are building or using raylib as a static library (or Linux shared library)

//----------------------------------------------------------------------------------
// Some basic Defines
//----------------------------------------------------------------------------------

enum DEG2RAD = PI / 180.0f;
enum RAD2DEG = 180.0f / PI;

enum MAX_TOUCH_POINTS = 10; // Maximum number of touch points supported

// Allow custom memory allocators

alias RL_MALLOC = malloc;

alias RL_CALLOC = calloc;

alias RL_REALLOC = realloc;

alias RL_FREE = free;

// NOTE: MSC C++ compiler does not support compound literals (C99 feature)
// Plain structures in C++ (without constructors) can be initialized from { } initializers.

extern (D) auto CLITERAL(T)(auto ref T type)
{
    return type;
}

// Some Basic Colors
// NOTE: Custom raylib color palette for amazing visuals on WHITE background // Light Gray // Gray // Dark Gray // Yellow // Gold // Orange // Pink // Red // Maroon // Green // Lime // Dark Green // Sky Blue // Blue // Dark Blue // Purple // Violet // Dark Purple // Beige // Brown // Dark Brown // White // Black // Blank (Transparent) // Magenta // My own White (raylib logo)
enum Colors
{
	LIGHTGRAY  = Color( 200, 200, 200, 255 ), // Light Gray
	GRAY       = Color( 130, 130, 130, 255 ), // Gray
	DARKGRAY   = Color( 80, 80, 80, 255 ), // Dark Gray
	YELLOW     = Color( 253, 249, 0, 255 ), // Yellow
	GOLD       = Color( 255, 203, 0, 255 ), // Gold
	ORANGE     = Color( 255, 161, 0, 255 ), // Orange
	PINK       = Color( 255, 109, 194, 255 ), // Pink
	RED        = Color( 230, 41, 55, 255 ), // Red
	MAROON     = Color( 190, 33, 55, 255 ), // Maroon
	GREEN      = Color( 0, 228, 48, 255 ), // Green
	LIME       = Color( 0, 158, 47, 255 ), // Lime
	DARKGREEN  = Color( 0, 117, 44, 255 ), // Dark Green
	SKYBLUE    = Color( 102, 191, 255, 255 ), // Sky Blue
	BLUE       = Color( 0, 121, 241, 255 ), // Blue
	DARKBLUE   = Color( 0, 82, 172, 255 ), // Dark Blue
	PURPLE     = Color( 200, 122, 255, 255 ), // Purple
	VIOLET     = Color( 135, 60, 190, 255 ), // Violet
	DARKPURPLE = Color( 112, 31, 126, 255 ), // Dark Purple
	BEIGE      = Color( 211, 176, 131, 255 ), // Beige
	BROWN      = Color( 127, 106, 79, 255 ), // Brown
	DARKBROWN  = Color( 76, 63, 47, 255 ), // Dark Brown

	WHITE      = Color( 255, 255, 255, 255 ), // White
	BLACK      = Color( 0, 0, 0, 255 ), // Black
	BLANK      = Color( 0, 0, 0, 0 ), // Blank (Transparent)
	MAGENTA    = Color( 255, 0, 255, 255 ), // Magenta
	RAYWHITE   = Color( 245, 245, 245, 255 ), // My own White (raylib logo)
}

// Temporal hack to avoid breaking old codebases using
// deprecated raylib implementation of these functions
alias FormatText = TextFormat;
alias SubText = TextSubtext;
alias ShowWindow = UnhideWindow;
alias LoadText = LoadFileText;

//----------------------------------------------------------------------------------
// Structures Definition
//----------------------------------------------------------------------------------
// Boolean type

// Vector2 type
struct Vector2
{
    float x;
    float y;
}

// Vector3 type
struct Vector3
{
    float x;
    float y;
    float z;
}

// Vector4 type
struct Vector4
{
    float x;
    float y;
    float z;
    float w;
}

// Quaternion type, same as Vector4
alias Quaternion = Vector4;

// Matrix type (OpenGL style 4x4 - right handed, column major)
struct Matrix
{
    float m0;
    float m4;
    float m8;
    float m12;
    float m1;
    float m5;
    float m9;
    float m13;
    float m2;
    float m6;
    float m10;
    float m14;
    float m3;
    float m7;
    float m11;
    float m15;
}

// Color type, RGBA (32bit)
struct Color
{
    ubyte r;
    ubyte g;
    ubyte b;
    ubyte a;
}

// Rectangle type
struct Rectangle
{
    float x;
    float y;
    float width;
    float height;
}

// Image type, bpp always RGBA (32bit)
// NOTE: Data stored in CPU memory (RAM)
struct Image
{
    void* data; // Image raw data
    int width; // Image base width
    int height; // Image base height
    int mipmaps; // Mipmap levels, 1 by default
    int format; // Data format (PixelFormat type)
}

// Texture2D type
// NOTE: Data stored in GPU memory
struct Texture2D
{
    uint id; // OpenGL texture id
    int width; // Texture base width
    int height; // Texture base height
    int mipmaps; // Mipmap levels, 1 by default
    int format; // Data format (PixelFormat type)
}

// Texture type, same as Texture2D
alias Texture = Texture2D;

// TextureCubemap type, actually, same as Texture2D
alias TextureCubemap = Texture2D;

// RenderTexture2D type, for texture rendering
struct RenderTexture2D
{
    uint id; // OpenGL Framebuffer Object (FBO) id
    Texture2D texture; // Color buffer attachment texture
    Texture2D depth; // Depth buffer attachment texture
    bool depthTexture; // Track if depth attachment is a texture or renderbuffer
}

// RenderTexture type, same as RenderTexture2D
alias RenderTexture = RenderTexture2D;

// N-Patch layout info
struct NPatchInfo
{
    Rectangle sourceRec; // Region in the texture
    int left; // left border offset
    int top; // top border offset
    int right; // right border offset
    int bottom; // bottom border offset
    int type; // layout of the n-patch: 3x3, 1x3 or 3x1
}

// Font character info
struct CharInfo
{
    int value; // Character value (Unicode)
    int offsetX; // Character offset X when drawing
    int offsetY; // Character offset Y when drawing
    int advanceX; // Character advance position X
    Image image; // Character image data
}

// Font type, includes texture and charSet array data
struct Font
{
    int baseSize; // Base size (default chars height)
    int charsCount; // Number of characters
    Texture2D texture; // Characters texture atlas
    Rectangle* recs; // Characters rectangles in texture
    CharInfo* chars; // Characters info data
}

alias SpriteFont = Font; // SpriteFont type fallback, defaults to Font

// Camera type, defines a camera position/orientation in 3d space
struct Camera3D
{
    Vector3 position; // Camera position
    Vector3 target; // Camera target it looks-at
    Vector3 up; // Camera up vector (rotation over its axis)
    float fovy; // Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
    int type; // Camera type, defines projection type: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
}

alias Camera = Camera3D; // Camera type fallback, defaults to Camera3D

// Camera2D type, defines a 2d camera
struct Camera2D
{
    Vector2 offset; // Camera offset (displacement from target)
    Vector2 target; // Camera target (rotation and zoom origin)
    float rotation; // Camera rotation in degrees
    float zoom; // Camera zoom (scaling), should be 1.0f by default
}

// Vertex data definning a mesh
// NOTE: Data stored in CPU memory (and GPU)
struct Mesh
{
    int vertexCount; // Number of vertices stored in arrays
    int triangleCount; // Number of triangles stored (indexed or not)

    // Default vertex data
    float* vertices; // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    float* texcoords; // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    float* texcoords2; // Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
    float* normals; // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    float* tangents; // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    ubyte* colors; // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    ushort* indices; // Vertex indices (in case vertex data comes indexed)

    // Animation vertex data
    float* animVertices; // Animated vertex positions (after bones transformations)
    float* animNormals; // Animated normals (after bones transformations)
    int* boneIds; // Vertex bone ids, up to 4 bones influence by vertex (skinning)
    float* boneWeights; // Vertex bone weight, up to 4 bones influence by vertex (skinning)

    // OpenGL identifiers
    uint vaoId; // OpenGL Vertex Array Object id
    uint* vboId; // OpenGL Vertex Buffer Objects id (default vertex data)
}

// Shader type (generic)
struct Shader
{
    uint id; // Shader program id
    int* locs; // Shader locations array (MAX_SHADER_LOCATIONS)
}

// Material texture map
struct MaterialMap
{
    Texture2D texture; // Material map texture
    Color color; // Material map color
    float value; // Material map value
}

// Material type (generic)
struct Material
{
    Shader shader; // Material shader
    MaterialMap* maps; // Material maps array (MAX_MATERIAL_MAPS)
    float* params; // Material generic parameters (if required)
}

// Transformation properties
struct Transform
{
    Vector3 translation; // Translation
    Quaternion rotation; // Rotation
    Vector3 scale; // Scale
}

// Bone information
struct BoneInfo
{
    char[32] name; // Bone name
    int parent; // Bone parent
}

// Model type
struct Model
{
    Matrix transform; // Local transform matrix

    int meshCount; // Number of meshes
    Mesh* meshes; // Meshes array

    int materialCount; // Number of materials
    Material* materials; // Materials array
    int* meshMaterial; // Mesh material number

    // Animation data
    int boneCount; // Number of bones
    BoneInfo* bones; // Bones information (skeleton)
    Transform* bindPose; // Bones base transformation (pose)
}

// Model animation
struct ModelAnimation
{
    int boneCount; // Number of bones
    BoneInfo* bones; // Bones information (skeleton)

    int frameCount; // Number of animation frames
    Transform** framePoses; // Poses array by frame
}

// Ray type (useful for raycast)
struct Ray
{
    Vector3 position; // Ray position (origin)
    Vector3 direction; // Ray direction
}

// Raycast hit information
struct RayHitInfo
{
    bool hit; // Did the ray hit something?
    float distance; // Distance to nearest hit
    Vector3 position; // Position of nearest hit
    Vector3 normal; // Surface normal of hit
}

// Bounding box type
struct BoundingBox
{
    Vector3 min; // Minimum vertex box-corner
    Vector3 max; // Maximum vertex box-corner
}


// Head-Mounted-Display device parameters
struct VrDeviceInfo
{
    int hResolution; // HMD horizontal resolution in pixels
    int vResolution; // HMD vertical resolution in pixels
    float hScreenSize; // HMD horizontal size in meters
    float vScreenSize; // HMD vertical size in meters
    float vScreenCenter; // HMD screen center in meters
    float eyeToScreenDistance; // HMD distance between eye and display in meters
    float lensSeparationDistance; // HMD lens separation distance in meters
    float interpupillaryDistance; // HMD IPD (distance between pupils) in meters
    float[4] lensDistortionValues; // HMD lens distortion constant parameters
    float[4] chromaAbCorrection; // HMD chromatic aberration correction parameters
}

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------
// System config flags
// NOTE: Used for bit masks
enum ConfigFlag
{
    FLAG_RESERVED = 1, // Reserved
    FLAG_FULLSCREEN_MODE = 2, // Set to run program in fullscreen
    FLAG_WINDOW_RESIZABLE = 4, // Set to allow resizable window
    FLAG_WINDOW_UNDECORATED = 8, // Set to disable window decoration (frame and buttons)
    FLAG_WINDOW_TRANSPARENT = 16, // Set to allow transparent window
    FLAG_WINDOW_HIDDEN = 128, // Set to create the window initially hidden
    FLAG_WINDOW_ALWAYS_RUN = 256, // Set to allow windows running while minimized
    FLAG_MSAA_4X_HINT = 32, // Set to try enabling MSAA 4X
    FLAG_VSYNC_HINT = 64 // Set to try enabling V-Sync on GPU
}

// Trace log type
enum TraceLogType
{
    LOG_ALL = 0, // Display all logs
    LOG_TRACE = 1,
    LOG_DEBUG = 2,
    LOG_INFO = 3,
    LOG_WARNING = 4,
    LOG_ERROR = 5,
    LOG_FATAL = 6,
    LOG_NONE = 7 // Disable logging
}

// Keyboard keys
enum KeyboardKey
{
    // Alphanumeric keys
    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,

    // Function keys
    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,

    // Keypad keys
    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336
}

// Android buttons
enum AndroidButton
{
    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25
}

// Mouse buttons
enum MouseButton
{
    MOUSE_LEFT_BUTTON = 0,
    MOUSE_RIGHT_BUTTON = 1,
    MOUSE_MIDDLE_BUTTON = 2
}

// Gamepad number
enum GamepadNumber
{
    GAMEPAD_PLAYER1 = 0,
    GAMEPAD_PLAYER2 = 1,
    GAMEPAD_PLAYER3 = 2,
    GAMEPAD_PLAYER4 = 3
}

// Gamepad Buttons
enum GamepadButton
{
    // This is here just for error checking
    GAMEPAD_BUTTON_UNKNOWN = 0,

    // This is normally a DPAD
    GAMEPAD_BUTTON_LEFT_FACE_UP = 1,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,

    // This normally corresponds with PlayStation and Xbox controllers
    // XBOX: [Y,X,A,B]
    // PS3: [Triangle,Square,Cross,Circle]
    // No support for 6 button controllers though..
    GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,

    // Triggers
    GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12,

    // These are buttons in the center of the gamepad
    GAMEPAD_BUTTON_MIDDLE_LEFT = 13, //PS3 Select
    GAMEPAD_BUTTON_MIDDLE = 14, //PS Button/XBOX Button
    GAMEPAD_BUTTON_MIDDLE_RIGHT = 15, //PS3 Start

    // These are the joystick press in buttons
    GAMEPAD_BUTTON_LEFT_THUMB = 16,
    GAMEPAD_BUTTON_RIGHT_THUMB = 17
}

enum GamepadAxis
{
    // This is here just for error checking
    GAMEPAD_AXIS_UNKNOWN = 0,

    // Left stick
    GAMEPAD_AXIS_LEFT_X = 1,
    GAMEPAD_AXIS_LEFT_Y = 2,

    // Right stick
    GAMEPAD_AXIS_RIGHT_X = 3,
    GAMEPAD_AXIS_RIGHT_Y = 4,

    // Pressure levels for the back triggers
    GAMEPAD_AXIS_LEFT_TRIGGER = 5, // [1..-1] (pressure-level)
    GAMEPAD_AXIS_RIGHT_TRIGGER = 6 // [1..-1] (pressure-level)
}

// Shader location point type
enum ShaderLocationIndex
{
    LOC_VERTEX_POSITION = 0,
    LOC_VERTEX_TEXCOORD01 = 1,
    LOC_VERTEX_TEXCOORD02 = 2,
    LOC_VERTEX_NORMAL = 3,
    LOC_VERTEX_TANGENT = 4,
    LOC_VERTEX_COLOR = 5,
    LOC_MATRIX_MVP = 6,
    LOC_MATRIX_MODEL = 7,
    LOC_MATRIX_VIEW = 8,
    LOC_MATRIX_PROJECTION = 9,
    LOC_VECTOR_VIEW = 10,
    LOC_COLOR_DIFFUSE = 11,
    LOC_COLOR_SPECULAR = 12,
    LOC_COLOR_AMBIENT = 13,
    LOC_MAP_ALBEDO = 14, // LOC_MAP_DIFFUSE
    LOC_MAP_METALNESS = 15, // LOC_MAP_SPECULAR
    LOC_MAP_NORMAL = 16,
    LOC_MAP_ROUGHNESS = 17,
    LOC_MAP_OCCLUSION = 18,
    LOC_MAP_EMISSION = 19,
    LOC_MAP_HEIGHT = 20,
    LOC_MAP_CUBEMAP = 21,
    LOC_MAP_IRRADIANCE = 22,
    LOC_MAP_PREFILTER = 23,
    LOC_MAP_BRDF = 24
}

enum LOC_MAP_DIFFUSE = ShaderLocationIndex.LOC_MAP_ALBEDO;
enum LOC_MAP_SPECULAR = ShaderLocationIndex.LOC_MAP_METALNESS;

// Shader uniform data types
enum ShaderUniformDataType
{
    UNIFORM_FLOAT = 0,
    UNIFORM_VEC2 = 1,
    UNIFORM_VEC3 = 2,
    UNIFORM_VEC4 = 3,
    UNIFORM_INT = 4,
    UNIFORM_IVEC2 = 5,
    UNIFORM_IVEC3 = 6,
    UNIFORM_IVEC4 = 7,
    UNIFORM_SAMPLER2D = 8
}

// Material map type
enum MaterialMapType
{
    MAP_ALBEDO = 0, // MAP_DIFFUSE
    MAP_METALNESS = 1, // MAP_SPECULAR
    MAP_NORMAL = 2,
    MAP_ROUGHNESS = 3,
    MAP_OCCLUSION = 4,
    MAP_EMISSION = 5,
    MAP_HEIGHT = 6,
    MAP_CUBEMAP = 7, // NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_IRRADIANCE = 8, // NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_PREFILTER = 9, // NOTE: Uses GL_TEXTURE_CUBE_MAP
    MAP_BRDF = 10
}

enum MAP_DIFFUSE = MaterialMapType.MAP_ALBEDO;
enum MAP_SPECULAR = MaterialMapType.MAP_METALNESS;

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
enum PixelFormat
{
    UNCOMPRESSED_GRAYSCALE = 1, // 8 bit per pixel (no alpha)
    UNCOMPRESSED_GRAY_ALPHA = 2, // 8*2 bpp (2 channels)
    UNCOMPRESSED_R5G6B5 = 3, // 16 bpp
    UNCOMPRESSED_R8G8B8 = 4, // 24 bpp
    UNCOMPRESSED_R5G5B5A1 = 5, // 16 bpp (1 bit alpha)
    UNCOMPRESSED_R4G4B4A4 = 6, // 16 bpp (4 bit alpha)
    UNCOMPRESSED_R8G8B8A8 = 7, // 32 bpp
    UNCOMPRESSED_R32 = 8, // 32 bpp (1 channel - float)
    UNCOMPRESSED_R32G32B32 = 9, // 32*3 bpp (3 channels - float)
    UNCOMPRESSED_R32G32B32A32 = 10, // 32*4 bpp (4 channels - float)
    COMPRESSED_DXT1_RGB = 11, // 4 bpp (no alpha)
    COMPRESSED_DXT1_RGBA = 12, // 4 bpp (1 bit alpha)
    COMPRESSED_DXT3_RGBA = 13, // 8 bpp
    COMPRESSED_DXT5_RGBA = 14, // 8 bpp
    COMPRESSED_ETC1_RGB = 15, // 4 bpp
    COMPRESSED_ETC2_RGB = 16, // 4 bpp
    COMPRESSED_ETC2_EAC_RGBA = 17, // 8 bpp
    COMPRESSED_PVRT_RGB = 18, // 4 bpp
    COMPRESSED_PVRT_RGBA = 19, // 4 bpp
    COMPRESSED_ASTC_4x4_RGBA = 20, // 8 bpp
    COMPRESSED_ASTC_8x8_RGBA = 21 // 2 bpp
}

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
enum TextureFilterMode
{
    FILTER_POINT = 0, // No filter, just pixel aproximation
    FILTER_BILINEAR = 1, // Linear filtering
    FILTER_TRILINEAR = 2, // Trilinear filtering (linear with mipmaps)
    FILTER_ANISOTROPIC_4X = 3, // Anisotropic filtering 4x
    FILTER_ANISOTROPIC_8X = 4, // Anisotropic filtering 8x
    FILTER_ANISOTROPIC_16X = 5 // Anisotropic filtering 16x
}

// Cubemap layout type
enum CubemapLayoutType
{
    CUBEMAP_AUTO_DETECT = 0, // Automatically detect layout type
    CUBEMAP_LINE_VERTICAL = 1, // Layout is defined by a vertical line with faces
    CUBEMAP_LINE_HORIZONTAL = 2, // Layout is defined by an horizontal line with faces
    CUBEMAP_CROSS_THREE_BY_FOUR = 3, // Layout is defined by a 3x4 cross with cubemap faces
    CUBEMAP_CROSS_FOUR_BY_THREE = 4, // Layout is defined by a 4x3 cross with cubemap faces
    CUBEMAP_PANORAMA = 5 // Layout is defined by a panorama image (equirectangular map)
}

// Texture parameters: wrap mode
enum TextureWrapMode
{
    WRAP_REPEAT = 0, // Repeats texture in tiled mode
    WRAP_CLAMP = 1, // Clamps texture to edge pixel in tiled mode
    WRAP_MIRROR_REPEAT = 2, // Mirrors and repeats the texture in tiled mode
    WRAP_MIRROR_CLAMP = 3 // Mirrors and clamps to border the texture in tiled mode
}

// Font type, defines generation method
enum FontType
{
    FONT_DEFAULT = 0, // Default font generation, anti-aliased
    FONT_BITMAP = 1, // Bitmap font generation, no anti-aliasing
    FONT_SDF = 2 // SDF font generation, requires external shader
}

// Color blending modes (pre-defined)
enum BlendMode
{
    BLEND_ALPHA = 0, // Blend textures considering alpha (default)
    BLEND_ADDITIVE = 1, // Blend textures adding colors
    BLEND_MULTIPLIED = 2 // Blend textures multiplying colors
}

// Gestures type
// NOTE: It could be used as flags to enable only some gestures
enum GestureType
{
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512
}

// Camera system modes
enum CameraMode
{
    CAMERA_CUSTOM = 0,
    CAMERA_FREE = 1,
    CAMERA_ORBITAL = 2,
    CAMERA_FIRST_PERSON = 3,
    CAMERA_THIRD_PERSON = 4
}

// Camera projection modes
enum CameraType
{
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC = 1
}

// Type of n-patch
enum NPatchType
{
    NPT_9PATCH = 0, // Npatch defined by 3x3 tiles
    NPT_3PATCH_VERTICAL = 1, // Npatch defined by 1x3 tiles
    NPT_3PATCH_HORIZONTAL = 2 // Npatch defined by 3x1 tiles
}

// Callbacks to be implemented by users
alias TraceLogCallback = void function (int logType, const(char)* text, va_list args);

// Prevents name mangling of functions

//------------------------------------------------------------------------------------
// Global Variables Definition
//------------------------------------------------------------------------------------
// It's lonely here...

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------

// Window-related functions
void InitWindow (int width, int height, const(char)* title); // Initialize window and OpenGL context
bool WindowShouldClose (); // Check if KEY_ESCAPE pressed or Close icon pressed
void CloseWindow (); // Close window and unload OpenGL context
bool IsWindowReady (); // Check if window has been initialized successfully
bool IsWindowMinimized (); // Check if window has been minimized (or lost focus)
bool IsWindowResized (); // Check if window has been resized
bool IsWindowHidden (); // Check if window is currently hidden
bool IsWindowFullscreen (); // Check if window is currently fullscreen
void ToggleFullscreen (); // Toggle fullscreen mode (only PLATFORM_DESKTOP)
void UnhideWindow (); // Show the window
void HideWindow (); // Hide the window
void SetWindowIcon (Image image); // Set icon for window (only PLATFORM_DESKTOP)
void SetWindowTitle (const(char)* title); // Set title for window (only PLATFORM_DESKTOP)
void SetWindowPosition (int x, int y); // Set window position on screen (only PLATFORM_DESKTOP)
void SetWindowMonitor (int monitor); // Set monitor for the current window (fullscreen mode)
void SetWindowMinSize (int width, int height); // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
void SetWindowSize (int width, int height); // Set window dimensions
void* GetWindowHandle (); // Get native window handle
int GetScreenWidth (); // Get current screen width
int GetScreenHeight (); // Get current screen height
int GetMonitorCount (); // Get number of connected monitors
int GetMonitorWidth (int monitor); // Get primary monitor width
int GetMonitorHeight (int monitor); // Get primary monitor height
int GetMonitorPhysicalWidth (int monitor); // Get primary monitor physical width in millimetres
int GetMonitorPhysicalHeight (int monitor); // Get primary monitor physical height in millimetres
Vector2 GetWindowPosition (); // Get window position XY on monitor
const(char)* GetMonitorName (int monitor); // Get the human-readable, UTF-8 encoded name of the primary monitor
const(char)* GetClipboardText (); // Get clipboard text content
void SetClipboardText (const(char)* text); // Set clipboard text content

// Cursor-related functions
void ShowCursor (); // Shows cursor
void HideCursor (); // Hides cursor
bool IsCursorHidden (); // Check if cursor is not visible
void EnableCursor (); // Enables cursor (unlock cursor)
void DisableCursor (); // Disables cursor (lock cursor)

// Drawing-related functions
void ClearBackground (Color color); // Set background color (framebuffer clear color)
void BeginDrawing (); // Setup canvas (framebuffer) to start drawing
void EndDrawing (); // End canvas drawing and swap buffers (double buffering)
void BeginMode2D (Camera2D camera); // Initialize 2D mode with custom camera (2D)
void EndMode2D (); // Ends 2D mode with custom camera
void BeginMode3D (Camera3D camera); // Initializes 3D mode with custom camera (3D)
void EndMode3D (); // Ends 3D mode and returns to default 2D orthographic mode
void BeginTextureMode (RenderTexture2D target); // Initializes render texture for drawing
void EndTextureMode (); // Ends drawing to render texture
void BeginScissorMode (int x, int y, int width, int height); // Begin scissor mode (define screen area for following drawing)
void EndScissorMode (); // End scissor mode

// Screen-space-related functions
Ray GetMouseRay (Vector2 mousePosition, Camera camera); // Returns a ray trace from mouse position
Matrix GetCameraMatrix (Camera camera); // Returns camera transform matrix (view matrix)
Matrix GetCameraMatrix2D (Camera2D camera); // Returns camera 2d transform matrix
Vector2 GetWorldToScreen (Vector3 position, Camera camera); // Returns the screen space position for a 3d world space position
Vector2 GetWorldToScreenEx (Vector3 position, Camera camera, int width, int height); // Returns size position for a 3d world space position
Vector2 GetWorldToScreen2D (Vector2 position, Camera2D camera); // Returns the screen space position for a 2d camera world space position
Vector2 GetScreenToWorld2D (Vector2 position, Camera2D camera); // Returns the world space position for a 2d camera screen space position

// Timing-related functions
void SetTargetFPS (int fps); // Set target FPS (maximum)
int GetFPS (); // Returns current FPS
float GetFrameTime (); // Returns time in seconds for last frame drawn
double GetTime (); // Returns elapsed time in seconds since InitWindow()

// Color-related functions
int ColorToInt (Color color); // Returns hexadecimal value for a Color
Vector4 ColorNormalize (Color color); // Returns color normalized as float [0..1]
Color ColorFromNormalized (Vector4 normalized); // Returns color from normalized values [0..1]
Vector3 ColorToHSV (Color color); // Returns HSV values for a Color
Color ColorFromHSV (Vector3 hsv); // Returns a Color from HSV values
Color GetColor (int hexValue); // Returns a Color struct from hexadecimal value
Color Fade (Color color, float alpha); // Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

// Misc. functions
void SetConfigFlags (uint flags); // Setup window configuration flags (view FLAGS)
void SetTraceLogLevel (int logType); // Set the current threshold (minimum) log level
void SetTraceLogExit (int logType); // Set the exit threshold (minimum) log level
void SetTraceLogCallback (TraceLogCallback callback); // Set a trace log callback to enable custom logging
void TraceLog (int logType, const(char)* text, ...); // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
void TakeScreenshot (const(char)* fileName); // Takes a screenshot of current screen (saved a .png)
int GetRandomValue (int min, int max); // Returns a random value between min and max (both included)

// Files management functions
ubyte* LoadFileData (const(char)* fileName, uint* bytesRead); // Load file data as byte array (read)
void SaveFileData (const(char)* fileName, void* data, uint bytesToWrite); // Save data to file from byte array (write)
char* LoadFileText (const(char)* fileName); // Load text data from file (read), returns a '\0' terminated string
void SaveFileText (const(char)* fileName, char* text); // Save text data to file (write), string must be '\0' terminated
bool FileExists (const(char)* fileName); // Check if file exists
bool IsFileExtension (const(char)* fileName, const(char)* ext); // Check file extension
bool DirectoryExists (const(char)* dirPath); // Check if a directory path exists
const(char)* GetExtension (const(char)* fileName); // Get pointer to extension for a filename string
const(char)* GetFileName (const(char)* filePath); // Get pointer to filename for a path string
const(char)* GetFileNameWithoutExt (const(char)* filePath); // Get filename string without extension (uses static string)
const(char)* GetDirectoryPath (const(char)* filePath); // Get full path for a given fileName with path (uses static string)
const(char)* GetPrevDirectoryPath (const(char)* dirPath); // Get previous directory path for a given path (uses static string)
const(char)* GetWorkingDirectory (); // Get current working directory (uses static string)
char** GetDirectoryFiles (const(char)* dirPath, int* count); // Get filenames in a directory path (memory should be freed)
void ClearDirectoryFiles (); // Clear directory files paths buffers (free memory)
bool ChangeDirectory (const(char)* dir); // Change working directory, returns true if success
bool IsFileDropped (); // Check if a file has been dropped into window
char** GetDroppedFiles (int* count); // Get dropped files names (memory should be freed)
void ClearDroppedFiles (); // Clear dropped files paths buffer (free memory)
c_long GetFileModTime (const(char)* fileName); // Get file modification time (last write time)

ubyte* CompressData (ubyte* data, int dataLength, int* compDataLength); // Compress data (DEFLATE algorythm)
ubyte* DecompressData (ubyte* compData, int compDataLength, int* dataLength); // Decompress data (DEFLATE algorythm)

// Persistent storage management
void SaveStorageValue (uint position, int value); // Save integer value to storage file (to defined position)
int LoadStorageValue (uint position); // Load integer value from storage file (from defined position)

void OpenURL (const(char)* url); // Open URL with default system browser (if available)

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard
bool IsKeyPressed (int key); // Detect if a key has been pressed once
bool IsKeyDown (int key); // Detect if a key is being pressed
bool IsKeyReleased (int key); // Detect if a key has been released once
bool IsKeyUp (int key); // Detect if a key is NOT being pressed
void SetExitKey (int key); // Set a custom key to exit program (default is ESC)
int GetKeyPressed (); // Get key pressed, call it multiple times for chars queued

// Input-related functions: gamepads
bool IsGamepadAvailable (int gamepad); // Detect if a gamepad is available
bool IsGamepadName (int gamepad, const(char)* name); // Check gamepad name (if available)
const(char)* GetGamepadName (int gamepad); // Return gamepad internal name id
bool IsGamepadButtonPressed (int gamepad, int button); // Detect if a gamepad button has been pressed once
bool IsGamepadButtonDown (int gamepad, int button); // Detect if a gamepad button is being pressed
bool IsGamepadButtonReleased (int gamepad, int button); // Detect if a gamepad button has been released once
bool IsGamepadButtonUp (int gamepad, int button); // Detect if a gamepad button is NOT being pressed
int GetGamepadButtonPressed (); // Get the last gamepad button pressed
int GetGamepadAxisCount (int gamepad); // Return gamepad axis count for a gamepad
float GetGamepadAxisMovement (int gamepad, int axis); // Return axis movement value for a gamepad axis

// Input-related functions: mouse
bool IsMouseButtonPressed (int button); // Detect if a mouse button has been pressed once
bool IsMouseButtonDown (int button); // Detect if a mouse button is being pressed
bool IsMouseButtonReleased (int button); // Detect if a mouse button has been released once
bool IsMouseButtonUp (int button); // Detect if a mouse button is NOT being pressed
int GetMouseX (); // Returns mouse position X
int GetMouseY (); // Returns mouse position Y
Vector2 GetMousePosition (); // Returns mouse position XY
void SetMousePosition (int x, int y); // Set mouse position XY
void SetMouseOffset (int offsetX, int offsetY); // Set mouse offset
void SetMouseScale (float scaleX, float scaleY); // Set mouse scaling
int GetMouseWheelMove (); // Returns mouse wheel movement Y

// Input-related functions: touch
int GetTouchX (); // Returns touch position X for touch point 0 (relative to screen size)
int GetTouchY (); // Returns touch position Y for touch point 0 (relative to screen size)
Vector2 GetTouchPosition (int index); // Returns touch position XY for a touch point index (relative to screen size)

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: gestures)
//------------------------------------------------------------------------------------
void SetGesturesEnabled (uint gestureFlags); // Enable a set of gestures using flags
bool IsGestureDetected (int gesture); // Check if a gesture have been detected
int GetGestureDetected (); // Get latest detected gesture
int GetTouchPointsCount (); // Get touch points count
float GetGestureHoldDuration (); // Get gesture hold time in milliseconds
Vector2 GetGestureDragVector (); // Get gesture drag vector
float GetGestureDragAngle (); // Get gesture drag angle
Vector2 GetGesturePinchVector (); // Get gesture pinch delta
float GetGesturePinchAngle (); // Get gesture pinch angle

//------------------------------------------------------------------------------------
// Camera System Functions (Module: camera)
//------------------------------------------------------------------------------------
void SetCameraMode (Camera camera, int mode); // Set camera mode (multiple camera modes available)
void UpdateCamera (Camera* camera); // Update camera position for selected mode

void SetCameraPanControl (int panKey); // Set camera pan key to combine with mouse movement (free camera)
void SetCameraAltControl (int altKey); // Set camera alt key to combine with mouse movement (free camera)
void SetCameraSmoothZoomControl (int szKey); // Set camera smooth zoom key to combine with mouse (free camera)
void SetCameraMoveControls (int frontKey, int backKey, int rightKey, int leftKey, int upKey, int downKey); // Set camera move controls (1st person and 3rd person cameras)

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------

// Basic shapes drawing functions
void DrawPixel (int posX, int posY, Color color); // Draw a pixel
void DrawPixelV (Vector2 position, Color color); // Draw a pixel (Vector version)
void DrawLine (int startPosX, int startPosY, int endPosX, int endPosY, Color color); // Draw a line
void DrawLineV (Vector2 startPos, Vector2 endPos, Color color); // Draw a line (Vector version)
void DrawLineEx (Vector2 startPos, Vector2 endPos, float thick, Color color); // Draw a line defining thickness
void DrawLineBezier (Vector2 startPos, Vector2 endPos, float thick, Color color); // Draw a line using cubic-bezier curves in-out
void DrawLineStrip (Vector2* points, int numPoints, Color color); // Draw lines sequence
void DrawCircle (int centerX, int centerY, float radius, Color color); // Draw a color-filled circle
void DrawCircleSector (Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color); // Draw a piece of a circle
void DrawCircleSectorLines (Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color); // Draw circle sector outline
void DrawCircleGradient (int centerX, int centerY, float radius, Color color1, Color color2); // Draw a gradient-filled circle
void DrawCircleV (Vector2 center, float radius, Color color); // Draw a color-filled circle (Vector version)
void DrawCircleLines (int centerX, int centerY, float radius, Color color); // Draw circle outline
void DrawEllipse (int centerX, int centerY, float radiusH, float radiusV, Color color); // Draw ellipse
void DrawEllipseLines (int centerX, int centerY, float radiusH, float radiusV, Color color); // Draw ellipse outline
void DrawRing (Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color); // Draw ring
void DrawRingLines (Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color); // Draw ring outline
void DrawRectangle (int posX, int posY, int width, int height, Color color); // Draw a color-filled rectangle
void DrawRectangleV (Vector2 position, Vector2 size, Color color); // Draw a color-filled rectangle (Vector version)
void DrawRectangleRec (Rectangle rec, Color color); // Draw a color-filled rectangle
void DrawRectanglePro (Rectangle rec, Vector2 origin, float rotation, Color color); // Draw a color-filled rectangle with pro parameters
void DrawRectangleGradientV (int posX, int posY, int width, int height, Color color1, Color color2); // Draw a vertical-gradient-filled rectangle
void DrawRectangleGradientH (int posX, int posY, int width, int height, Color color1, Color color2); // Draw a horizontal-gradient-filled rectangle
void DrawRectangleGradientEx (Rectangle rec, Color col1, Color col2, Color col3, Color col4); // Draw a gradient-filled rectangle with custom vertex colors
void DrawRectangleLines (int posX, int posY, int width, int height, Color color); // Draw rectangle outline
void DrawRectangleLinesEx (Rectangle rec, int lineThick, Color color); // Draw rectangle outline with extended parameters
void DrawRectangleRounded (Rectangle rec, float roundness, int segments, Color color); // Draw rectangle with rounded edges
void DrawRectangleRoundedLines (Rectangle rec, float roundness, int segments, int lineThick, Color color); // Draw rectangle with rounded edges outline
void DrawTriangle (Vector2 v1, Vector2 v2, Vector2 v3, Color color); // Draw a color-filled triangle (vertex in counter-clockwise order!)
void DrawTriangleLines (Vector2 v1, Vector2 v2, Vector2 v3, Color color); // Draw triangle outline (vertex in counter-clockwise order!)
void DrawTriangleFan (Vector2* points, int numPoints, Color color); // Draw a triangle fan defined by points (first vertex is the center)
void DrawTriangleStrip (Vector2* points, int pointsCount, Color color); // Draw a triangle strip defined by points
void DrawPoly (Vector2 center, int sides, float radius, float rotation, Color color); // Draw a regular polygon (Vector version)
void DrawPolyLines (Vector2 center, int sides, float radius, float rotation, Color color); // Draw a polygon outline of n sides

// Basic shapes collision detection functions
bool CheckCollisionRecs (Rectangle rec1, Rectangle rec2); // Check collision between two rectangles
bool CheckCollisionCircles (Vector2 center1, float radius1, Vector2 center2, float radius2); // Check collision between two circles
bool CheckCollisionCircleRec (Vector2 center, float radius, Rectangle rec); // Check collision between circle and rectangle
Rectangle GetCollisionRec (Rectangle rec1, Rectangle rec2); // Get collision rectangle for two rectangles collision
bool CheckCollisionPointRec (Vector2 point, Rectangle rec); // Check if point is inside rectangle
bool CheckCollisionPointCircle (Vector2 point, Vector2 center, float radius); // Check if point is inside circle
bool CheckCollisionPointTriangle (Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3); // Check if point is inside a triangle

//------------------------------------------------------------------------------------
// Texture Loading and Drawing Functions (Module: textures)
//------------------------------------------------------------------------------------

// Image loading functions
// NOTE: This functions do not require GPU access
Image LoadImage (const(char)* fileName); // Load image from file into CPU memory (RAM)
Image LoadImageEx (Color* pixels, int width, int height); // Load image from Color array data (RGBA - 32bit)
Image LoadImagePro (void* data, int width, int height, int format); // Load image from raw data with parameters
Image LoadImageRaw (const(char)* fileName, int width, int height, int format, int headerSize); // Load image from RAW file data
void UnloadImage (Image image); // Unload image from CPU memory (RAM)
void ExportImage (Image image, const(char)* fileName); // Export image data to file
void ExportImageAsCode (Image image, const(char)* fileName); // Export image as code file defining an array of bytes
Color* GetImageData (Image image); // Get pixel data from image as a Color struct array
Vector4* GetImageDataNormalized (Image image); // Get pixel data from image as Vector4 array (float normalized)

// Image generation functions
Image GenImageColor (int width, int height, Color color); // Generate image: plain color
Image GenImageGradientV (int width, int height, Color top, Color bottom); // Generate image: vertical gradient
Image GenImageGradientH (int width, int height, Color left, Color right); // Generate image: horizontal gradient
Image GenImageGradientRadial (int width, int height, float density, Color inner, Color outer); // Generate image: radial gradient
Image GenImageChecked (int width, int height, int checksX, int checksY, Color col1, Color col2); // Generate image: checked
Image GenImageWhiteNoise (int width, int height, float factor); // Generate image: white noise
Image GenImagePerlinNoise (int width, int height, int offsetX, int offsetY, float scale); // Generate image: perlin noise
Image GenImageCellular (int width, int height, int tileSize); // Generate image: cellular algorithm. Bigger tileSize means bigger cells

// Image manipulation functions
Image ImageCopy (Image image); // Create an image duplicate (useful for transformations)
Image ImageFromImage (Image image, Rectangle rec); // Create an image from another image piece
Image ImageText (const(char)* text, int fontSize, Color color); // Create an image from text (default font)
Image ImageTextEx (Font font, const(char)* text, float fontSize, float spacing, Color tint); // Create an image from text (custom sprite font)
void ImageToPOT (Image* image, Color fillColor); // Convert image to POT (power-of-two)
void ImageFormat (Image* image, int newFormat); // Convert image data to desired format
void ImageAlphaMask (Image* image, Image alphaMask); // Apply alpha mask to image
void ImageAlphaClear (Image* image, Color color, float threshold); // Clear alpha channel to desired color
void ImageAlphaCrop (Image* image, float threshold); // Crop image depending on alpha value
void ImageAlphaPremultiply (Image* image); // Premultiply alpha channel
void ImageCrop (Image* image, Rectangle crop); // Crop an image to a defined rectangle
void ImageResize (Image* image, int newWidth, int newHeight); // Resize image (Bicubic scaling algorithm)
void ImageResizeNN (Image* image, int newWidth, int newHeight); // Resize image (Nearest-Neighbor scaling algorithm)
void ImageResizeCanvas (Image* image, int newWidth, int newHeight, int offsetX, int offsetY, Color color); // Resize canvas and fill with color
void ImageMipmaps (Image* image); // Generate all mipmap levels for a provided image
void ImageDither (Image* image, int rBpp, int gBpp, int bBpp, int aBpp); // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
void ImageFlipVertical (Image* image); // Flip image vertically
void ImageFlipHorizontal (Image* image); // Flip image horizontally
void ImageRotateCW (Image* image); // Rotate image clockwise 90deg
void ImageRotateCCW (Image* image); // Rotate image counter-clockwise 90deg
void ImageColorTint (Image* image, Color color); // Modify image color: tint
void ImageColorInvert (Image* image); // Modify image color: invert
void ImageColorGrayscale (Image* image); // Modify image color: grayscale
void ImageColorContrast (Image* image, float contrast); // Modify image color: contrast (-100 to 100)
void ImageColorBrightness (Image* image, int brightness); // Modify image color: brightness (-255 to 255)
void ImageColorReplace (Image* image, Color color, Color replace); // Modify image color: replace color
Color* ImageExtractPalette (Image image, int maxPaletteSize, int* extractCount); // Extract color palette from image to maximum size (memory should be freed)
Rectangle GetImageAlphaBorder (Image image, float threshold); // Get image alpha border rectangle

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)
void ImageClearBackground (Image* dst, Color color); // Clear image background with given color
void ImageDrawPixel (Image* dst, int posX, int posY, Color color); // Draw pixel within an image
void ImageDrawPixelV (Image* dst, Vector2 position, Color color); // Draw pixel within an image (Vector version)
void ImageDrawLine (Image* dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color); // Draw line within an image
void ImageDrawLineV (Image* dst, Vector2 start, Vector2 end, Color color); // Draw line within an image (Vector version)
void ImageDrawCircle (Image* dst, int centerX, int centerY, int radius, Color color); // Draw circle within an image
void ImageDrawCircleV (Image* dst, Vector2 center, int radius, Color color); // Draw circle within an image (Vector version)
void ImageDrawRectangle (Image* dst, int posX, int posY, int width, int height, Color color); // Draw rectangle within an image
void ImageDrawRectangleV (Image* dst, Vector2 position, Vector2 size, Color color); // Draw rectangle within an image (Vector version)
void ImageDrawRectangleRec (Image* dst, Rectangle rec, Color color); // Draw rectangle within an image 
void ImageDrawRectangleLines (Image* dst, Rectangle rec, int thick, Color color); // Draw rectangle lines within an image
void ImageDraw (Image* dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint); // Draw a source image within a destination image (tint applied to source)
void ImageDrawText (Image* dst, Vector2 position, const(char)* text, int fontSize, Color color); // Draw text (default font) within an image (destination)
void ImageDrawTextEx (Image* dst, Vector2 position, Font font, const(char)* text, float fontSize, float spacing, Color color); // Draw text (custom sprite font) within an image (destination)

// Texture loading functions
// NOTE: These functions require GPU access
Texture2D LoadTexture (const(char)* fileName); // Load texture from file into GPU memory (VRAM)
Texture2D LoadTextureFromImage (Image image); // Load texture from image data
TextureCubemap LoadTextureCubemap (Image image, int layoutType); // Load cubemap from image, multiple image cubemap layouts supported
RenderTexture2D LoadRenderTexture (int width, int height); // Load texture for rendering (framebuffer)
void UnloadTexture (Texture2D texture); // Unload texture from GPU memory (VRAM)
void UnloadRenderTexture (RenderTexture2D target); // Unload render texture from GPU memory (VRAM)
void UpdateTexture (Texture2D texture, const(void)* pixels); // Update GPU texture with new data
Image GetTextureData (Texture2D texture); // Get pixel data from GPU texture and return an Image
Image GetScreenData (); // Get pixel data from screen buffer and return an Image (screenshot)

// Texture configuration functions
void GenTextureMipmaps (Texture2D* texture); // Generate GPU mipmaps for a texture
void SetTextureFilter (Texture2D texture, int filterMode); // Set texture scaling filter mode
void SetTextureWrap (Texture2D texture, int wrapMode); // Set texture wrapping mode

// Texture drawing functions
void DrawTexture (Texture2D texture, int posX, int posY, Color tint); // Draw a Texture2D
void DrawTextureV (Texture2D texture, Vector2 position, Color tint); // Draw a Texture2D with position defined as Vector2
void DrawTextureEx (Texture2D texture, Vector2 position, float rotation, float scale, Color tint); // Draw a Texture2D with extended parameters
void DrawTextureRec (Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint); // Draw a part of a texture defined by a rectangle
void DrawTextureQuad (Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint); // Draw texture quad with tiling and offset parameters
void DrawTexturePro (Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint); // Draw a part of a texture defined by a rectangle with 'pro' parameters
void DrawTextureNPatch (Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint); // Draws a texture (or part of it) that stretches or shrinks nicely

// Image/Texture misc functions
int GetPixelDataSize (int width, int height, int format); // Get pixel data size in bytes (image or texture)

//------------------------------------------------------------------------------------
// Font Loading and Text Drawing Functions (Module: text)
//------------------------------------------------------------------------------------

// Font loading/unloading functions
Font GetFontDefault (); // Get the default Font
Font LoadFont (const(char)* fileName); // Load font from file into GPU memory (VRAM)
Font LoadFontEx (const(char)* fileName, int fontSize, int* fontChars, int charsCount); // Load font from file with extended parameters
Font LoadFontFromImage (Image image, Color key, int firstChar); // Load font from Image (XNA style)
CharInfo* LoadFontData (const(char)* fileName, int fontSize, int* fontChars, int charsCount, int type); // Load font data for further use
Image GenImageFontAtlas (const(CharInfo)* chars, Rectangle** recs, int charsCount, int fontSize, int padding, int packMethod); // Generate image font atlas using chars info
void UnloadFont (Font font); // Unload Font from GPU memory (VRAM)

// Text drawing functions
void DrawFPS (int posX, int posY); // Shows current FPS
void DrawText (const(char)* text, int posX, int posY, int fontSize, Color color); // Draw text (using default font)
void DrawTextEx (Font font, const(char)* text, Vector2 position, float fontSize, float spacing, Color tint); // Draw text using font and additional parameters
void DrawTextRec (Font font, const(char)* text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint); // Draw text using font inside rectangle limits
void DrawTextRecEx (
    Font font,
    const(char)* text,
    Rectangle rec,
    float fontSize,
    float spacing,
    bool wordWrap,
    Color tint,
    int selectStart,
    int selectLength,
    Color selectTint,
    Color selectBackTint); // Draw text using font inside rectangle limits with support for text selection
void DrawTextCodepoint (Font font, int codepoint, Vector2 position, float scale, Color tint); // Draw one character (codepoint)

// Text misc. functions
int MeasureText (const(char)* text, int fontSize); // Measure string width for default font
Vector2 MeasureTextEx (Font font, const(char)* text, float fontSize, float spacing); // Measure string size for Font
int GetGlyphIndex (Font font, int codepoint); // Get index position for a unicode character on font

// Text strings management functions (no utf8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!
int TextCopy (char* dst, const(char)* src); // Copy one string to another, returns bytes copied
bool TextIsEqual (const(char)* text1, const(char)* text2); // Check if two text string are equal
uint TextLength (const(char)* text); // Get text length, checks for '\0' ending
const(char)* TextFormat (const(char)* text, ...); // Text formatting with variables (sprintf style)
const(char)* TextSubtext (const(char)* text, int position, int length); // Get a piece of a text string
char* TextReplace (char* text, const(char)* replace, const(char)* by); // Replace text string (memory must be freed!)
char* TextInsert (const(char)* text, const(char)* insert, int position); // Insert text in a position (memory must be freed!)
const(char)* TextJoin (const(char*)* textList, int count, const(char)* delimiter); // Join text strings with delimiter
const(char*)* TextSplit (const(char)* text, char delimiter, int* count); // Split text into multiple strings
void TextAppend (char* text, const(char)* append, int* position); // Append text at specific position and move cursor!
int TextFindIndex (const(char)* text, const(char)* find); // Find first text occurrence within a string
const(char)* TextToUpper (const(char)* text); // Get upper case version of provided string
const(char)* TextToLower (const(char)* text); // Get lower case version of provided string
const(char)* TextToPascal (const(char)* text); // Get Pascal case notation version of provided string
int TextToInteger (const(char)* text); // Get integer value from text (negative values not supported)
char* TextToUtf8 (int* codepoints, int length); // Encode text codepoint into utf8 text (memory must be freed!)

// UTF8 text strings management functions
int* GetCodepoints (const(char)* text, int* count); // Get all codepoints in a string, codepoints count returned by parameters
int GetCodepointsCount (const(char)* text); // Get total number of characters (codepoints) in a UTF8 encoded string
int GetNextCodepoint (const(char)* text, int* bytesProcessed); // Returns next codepoint in a UTF8 encoded string; 0x3f('?') is returned on failure
const(char)* CodepointToUtf8 (int codepoint, int* byteLength); // Encode codepoint into utf8 text (char array length returned as parameter)

//------------------------------------------------------------------------------------
// Basic 3d Shapes Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Basic geometric 3D shapes drawing functions
void DrawLine3D (Vector3 startPos, Vector3 endPos, Color color); // Draw a line in 3D world space
void DrawPoint3D (Vector3 position, Color color); // Draw a point in 3D space, actually a small line
void DrawCircle3D (Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color); // Draw a circle in 3D world space
void DrawCube (Vector3 position, float width, float height, float length, Color color); // Draw cube
void DrawCubeV (Vector3 position, Vector3 size, Color color); // Draw cube (Vector version)
void DrawCubeWires (Vector3 position, float width, float height, float length, Color color); // Draw cube wires
void DrawCubeWiresV (Vector3 position, Vector3 size, Color color); // Draw cube wires (Vector version)
void DrawCubeTexture (Texture2D texture, Vector3 position, float width, float height, float length, Color color); // Draw cube textured
void DrawSphere (Vector3 centerPos, float radius, Color color); // Draw sphere
void DrawSphereEx (Vector3 centerPos, float radius, int rings, int slices, Color color); // Draw sphere with extended parameters
void DrawSphereWires (Vector3 centerPos, float radius, int rings, int slices, Color color); // Draw sphere wires
void DrawCylinder (Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color); // Draw a cylinder/cone
void DrawCylinderWires (Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color); // Draw a cylinder/cone wires
void DrawPlane (Vector3 centerPos, Vector2 size, Color color); // Draw a plane XZ
void DrawRay (Ray ray, Color color); // Draw a ray line
void DrawGrid (int slices, float spacing); // Draw a grid (centered at (0, 0, 0))
void DrawGizmo (Vector3 position); // Draw simple gizmo
//DrawTorus(), DrawTeapot() could be useful?

//------------------------------------------------------------------------------------
// Model 3d Loading and Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Model loading/unloading functions
Model LoadModel (const(char)* fileName); // Load model from files (meshes and materials)
Model LoadModelFromMesh (Mesh mesh); // Load model from generated mesh (default material)
void UnloadModel (Model model); // Unload model from memory (RAM and/or VRAM)

// Mesh loading/unloading functions
Mesh* LoadMeshes (const(char)* fileName, int* meshCount); // Load meshes from model file
void ExportMesh (Mesh mesh, const(char)* fileName); // Export mesh data to file
void UnloadMesh (Mesh mesh); // Unload mesh from memory (RAM and/or VRAM)

// Material loading/unloading functions
Material* LoadMaterials (const(char)* fileName, int* materialCount); // Load materials from model file
Material LoadMaterialDefault (); // Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
void UnloadMaterial (Material material); // Unload material from GPU memory (VRAM)
void SetMaterialTexture (Material* material, int mapType, Texture2D texture); // Set texture for a material map type (MAP_DIFFUSE, MAP_SPECULAR...)
void SetModelMeshMaterial (Model* model, int meshId, int materialId); // Set material for a mesh

// Model animations loading/unloading functions
ModelAnimation* LoadModelAnimations (const(char)* fileName, int* animsCount); // Load model animations from file
void UpdateModelAnimation (Model model, ModelAnimation anim, int frame); // Update model animation pose
void UnloadModelAnimation (ModelAnimation anim); // Unload animation data
bool IsModelAnimationValid (Model model, ModelAnimation anim); // Check model animation skeleton match

// Mesh generation functions
Mesh GenMeshPoly (int sides, float radius); // Generate polygonal mesh
Mesh GenMeshPlane (float width, float length, int resX, int resZ); // Generate plane mesh (with subdivisions)
Mesh GenMeshCube (float width, float height, float length); // Generate cuboid mesh
Mesh GenMeshSphere (float radius, int rings, int slices); // Generate sphere mesh (standard sphere)
Mesh GenMeshHemiSphere (float radius, int rings, int slices); // Generate half-sphere mesh (no bottom cap)
Mesh GenMeshCylinder (float radius, float height, int slices); // Generate cylinder mesh
Mesh GenMeshTorus (float radius, float size, int radSeg, int sides); // Generate torus mesh
Mesh GenMeshKnot (float radius, float size, int radSeg, int sides); // Generate trefoil knot mesh
Mesh GenMeshHeightmap (Image heightmap, Vector3 size); // Generate heightmap mesh from image data
Mesh GenMeshCubicmap (Image cubicmap, Vector3 cubeSize); // Generate cubes-based map mesh from image data

// Mesh manipulation functions
BoundingBox MeshBoundingBox (Mesh mesh); // Compute mesh bounding box limits
void MeshTangents (Mesh* mesh); // Compute mesh tangents
void MeshBinormals (Mesh* mesh); // Compute mesh binormals

// Model drawing functions
void DrawModel (Model model, Vector3 position, float scale, Color tint); // Draw a model (with texture if set)
void DrawModelEx (Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model with extended parameters
void DrawModelWires (Model model, Vector3 position, float scale, Color tint); // Draw a model wires (with texture if set)
void DrawModelWiresEx (Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint); // Draw a model wires (with texture if set) with extended parameters
void DrawBoundingBox (BoundingBox box, Color color); // Draw bounding box (wires)
void DrawBillboard (Camera camera, Texture2D texture, Vector3 center, float size, Color tint); // Draw a billboard texture
void DrawBillboardRec (Camera camera, Texture2D texture, Rectangle sourceRec, Vector3 center, float size, Color tint); // Draw a billboard texture defined by sourceRec

// Collision detection functions
bool CheckCollisionSpheres (Vector3 centerA, float radiusA, Vector3 centerB, float radiusB); // Detect collision between two spheres
bool CheckCollisionBoxes (BoundingBox box1, BoundingBox box2); // Detect collision between two bounding boxes
bool CheckCollisionBoxSphere (BoundingBox box, Vector3 center, float radius); // Detect collision between box and sphere
bool CheckCollisionRaySphere (Ray ray, Vector3 center, float radius); // Detect collision between ray and sphere
bool CheckCollisionRaySphereEx (Ray ray, Vector3 center, float radius, Vector3* collisionPoint); // Detect collision between ray and sphere, returns collision point
bool CheckCollisionRayBox (Ray ray, BoundingBox box); // Detect collision between ray and box
RayHitInfo GetCollisionRayModel (Ray ray, Model model); // Get collision info between ray and model
RayHitInfo GetCollisionRayTriangle (Ray ray, Vector3 p1, Vector3 p2, Vector3 p3); // Get collision info between ray and triangle
RayHitInfo GetCollisionRayGround (Ray ray, float groundHeight); // Get collision info between ray and ground plane (Y-normal plane)

//------------------------------------------------------------------------------------
// Shaders System Functions (Module: rlgl)
// NOTE: This functions are useless when using OpenGL 1.1
//------------------------------------------------------------------------------------

// Shader loading/unloading functions
Shader LoadShader (const(char)* vsFileName, const(char)* fsFileName); // Load shader from files and bind default locations
Shader LoadShaderCode (const(char)* vsCode, const(char)* fsCode); // Load shader from code strings and bind default locations
void UnloadShader (Shader shader); // Unload shader from GPU memory (VRAM)

Shader GetShaderDefault (); // Get default shader
Texture2D GetTextureDefault (); // Get default texture
Texture2D GetShapesTexture (); // Get texture to draw shapes
Rectangle GetShapesTextureRec (); // Get texture rectangle to draw shapes
void SetShapesTexture (Texture2D texture, Rectangle source); // Define default texture used to draw shapes

// Shader configuration functions
int GetShaderLocation (Shader shader, const(char)* uniformName); // Get shader uniform location
void SetShaderValue (Shader shader, int uniformLoc, const(void)* value, int uniformType); // Set shader uniform value
void SetShaderValueV (Shader shader, int uniformLoc, const(void)* value, int uniformType, int count); // Set shader uniform value vector
void SetShaderValueMatrix (Shader shader, int uniformLoc, Matrix mat); // Set shader uniform value (matrix 4x4)
void SetShaderValueTexture (Shader shader, int uniformLoc, Texture2D texture); // Set shader uniform value for texture
void SetMatrixProjection (Matrix proj); // Set a custom projection matrix (replaces internal projection matrix)
void SetMatrixModelview (Matrix view); // Set a custom modelview matrix (replaces internal modelview matrix)
Matrix GetMatrixModelview (); // Get internal modelview matrix
Matrix GetMatrixProjection (); // Get internal projection matrix

// Texture maps generation (PBR)
// NOTE: Required shaders should be provided
Texture2D GenTextureCubemap (Shader shader, Texture2D map, int size); // Generate cubemap texture from 2D texture
Texture2D GenTextureIrradiance (Shader shader, Texture2D cubemap, int size); // Generate irradiance texture using cubemap data
Texture2D GenTexturePrefilter (Shader shader, Texture2D cubemap, int size); // Generate prefilter texture using cubemap data
Texture2D GenTextureBRDF (Shader shader, int size); // Generate BRDF texture

// Shading begin/end functions
void BeginShaderMode (Shader shader); // Begin custom shader drawing
void EndShaderMode (); // End custom shader drawing (use default shader)
void BeginBlendMode (int mode); // Begin blending mode (alpha, additive, multiplied)
void EndBlendMode (); // End blending mode (reset to default: alpha blending)

// VR control functions
void InitVrSimulator (); // Init VR simulator for selected device parameters
void CloseVrSimulator (); // Close VR simulator for current device
void UpdateVrTracking (Camera* camera); // Update VR tracking (position and orientation) and camera
void SetVrConfiguration (VrDeviceInfo info, Shader distortion); // Set stereo rendering configuration parameters
bool IsVrSimulatorReady (); // Detect if VR simulator is ready
void ToggleVrMode (); // Enable/Disable VR experience
void BeginVrDrawing (); // Begin VR simulator stereo rendering
void EndVrDrawing (); // End VR simulator stereo rendering

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------

// Audio device management functions
void InitAudioDevice (); // Initialize audio device and context
void CloseAudioDevice (); // Close the audio device and context
bool IsAudioDeviceReady (); // Check if audio device has been initialized successfully
void SetMasterVolume (float volume); // Set master volume (listener)

// Wave/Sound loading/unloading functions
Wave LoadWave (const(char)* fileName); // Load wave data from file
Sound LoadSound (const(char)* fileName); // Load sound from file
Sound LoadSoundFromWave (Wave wave); // Load sound from wave data
void UpdateSound (Sound sound, const(void)* data, int samplesCount); // Update sound buffer with new data
void UnloadWave (Wave wave); // Unload wave data
void UnloadSound (Sound sound); // Unload sound
void ExportWave (Wave wave, const(char)* fileName); // Export wave data to file
void ExportWaveAsCode (Wave wave, const(char)* fileName); // Export wave sample data to code (.h)

// Wave/Sound management functions
void PlaySound (Sound sound); // Play a sound
void StopSound (Sound sound); // Stop playing a sound
void PauseSound (Sound sound); // Pause a sound
void ResumeSound (Sound sound); // Resume a paused sound
void PlaySoundMulti (Sound sound); // Play a sound (using multichannel buffer pool)
void StopSoundMulti (); // Stop any sound playing (using multichannel buffer pool)
int GetSoundsPlaying (); // Get number of sounds playing in the multichannel
bool IsSoundPlaying (Sound sound); // Check if a sound is currently playing
void SetSoundVolume (Sound sound, float volume); // Set volume for a sound (1.0 is max level)
void SetSoundPitch (Sound sound, float pitch); // Set pitch for a sound (1.0 is base level)
void WaveFormat (Wave* wave, int sampleRate, int sampleSize, int channels); // Convert wave data to desired format
Wave WaveCopy (Wave wave); // Copy a wave to a new wave
void WaveCrop (Wave* wave, int initSample, int finalSample); // Crop a wave to defined samples range
float* GetWaveData (Wave wave); // Get samples data from wave as a floats array

// Music management functions
Music LoadMusicStream (const(char)* fileName); // Load music stream from file
void UnloadMusicStream (Music music); // Unload music stream
void PlayMusicStream (Music music); // Start music playing
void UpdateMusicStream (Music music); // Updates buffers for music streaming
void StopMusicStream (Music music); // Stop music playing
void PauseMusicStream (Music music); // Pause music playing
void ResumeMusicStream (Music music); // Resume playing paused music
bool IsMusicPlaying (Music music); // Check if music is playing
void SetMusicVolume (Music music, float volume); // Set volume for music (1.0 is max level)
void SetMusicPitch (Music music, float pitch); // Set pitch for a music (1.0 is base level)
void SetMusicLoopCount (Music music, int count); // Set music loop count (loop repeats)
float GetMusicTimeLength (Music music); // Get music time length (in seconds)
float GetMusicTimePlayed (Music music); // Get current music time played (in seconds)

// AudioStream management functions
AudioStream InitAudioStream (uint sampleRate, uint sampleSize, uint channels); // Init audio stream (to stream raw audio pcm data)
void UpdateAudioStream (AudioStream stream, const(void)* data, int samplesCount); // Update audio stream buffers with data
void CloseAudioStream (AudioStream stream); // Close audio stream and free memory
bool IsAudioStreamProcessed (AudioStream stream); // Check if any audio stream buffers requires refill
void PlayAudioStream (AudioStream stream); // Play audio stream
void PauseAudioStream (AudioStream stream); // Pause audio stream
void ResumeAudioStream (AudioStream stream); // Resume audio stream
bool IsAudioStreamPlaying (AudioStream stream); // Check if audio stream is playing
void StopAudioStream (AudioStream stream); // Stop audio stream
void SetAudioStreamVolume (AudioStream stream, float volume); // Set volume for audio stream (1.0 is max level)
void SetAudioStreamPitch (AudioStream stream, float pitch); // Set pitch for audio stream (1.0 is base level)
void SetAudioStreamBufferSizeDefault (int size); // Default size for new audio streams

//------------------------------------------------------------------------------------
// Network (Module: network)
//------------------------------------------------------------------------------------

// IN PROGRESS: Check rnet.h for reference

// RAYLIB_H
/**********************************************************************************************
*
*   raymath v1.2 - Math functions to work with Vector3, Matrix and Quaternions
*
*   CONFIGURATION:
*
*   #define RAYMATH_IMPLEMENTATION
*       Generates the implementation of the library into the included file.
*       If not defined, the library is in header only mode and can be included in other headers
*       or source files without problems. But only ONE file should hold the implementation.
*
*   #define RAYMATH_HEADER_ONLY
*       Define static inline functions code, so #include header suffices for use.
*       This may use up lots of memory.
*
*   #define RAYMATH_STANDALONE
*       Avoid raylib.h header inclusion in this file.
*       Vector3 and Matrix data types are defined internally in raymath module.
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2015-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

extern (C):

//#define RAYMATH_STANDALONE      // NOTE: To use raymath as standalone lib, just uncomment this line
//#define RAYMATH_HEADER_ONLY     // NOTE: To compile functions as static inline, uncomment this line

// Required for structs: Vector3, Matrix

// We are building raylib as a Win32 shared library (.dll).

// We are using raylib as a Win32 shared library (.dll)

// Provide external definition

// Functions may be inlined, no external out-of-line definition

// plain inline not supported by tinycc (See issue #435) // Functions may be inlined or external definition used

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------

// Return float vector for Matrix

extern (D) auto MatrixToFloat(T)(auto ref T mat)
{
    return MatrixToFloatV(mat).v;
}

// Return float vector for Vector3

extern (D) auto Vector3ToFloat(T)(auto ref T vec)
{
    return Vector3ToFloatV(vec).v;
}

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------

// Vector2 type

// Vector3 type

// Quaternion type

// Matrix type (OpenGL style 4x4 - right handed, column major)

// NOTE: Helper types to be used instead of array return types for *ToFloat functions
struct float3
{
    float[3] v;
}

struct float16
{
    float[16] v;
}

// Required for: sinf(), cosf(), sqrtf(), tan(), fabs()

//----------------------------------------------------------------------------------
// Module Functions Definition - Utils math
//----------------------------------------------------------------------------------

// Clamp float value
float Clamp (float value, float min, float max);

// Calculate linear interpolation between two floats
float Lerp (float start, float end, float amount);

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector2 math
//----------------------------------------------------------------------------------

// Vector with components value 0.0f
Vector2 Vector2Zero ();

// Vector with components value 1.0f
Vector2 Vector2One ();

// Add two vectors (v1 + v2)
Vector2 Vector2Add (Vector2 v1, Vector2 v2);

// Subtract two vectors (v1 - v2)
Vector2 Vector2Subtract (Vector2 v1, Vector2 v2);

// Calculate vector length
float Vector2Length (Vector2 v);

// Calculate two vectors dot product
float Vector2DotProduct (Vector2 v1, Vector2 v2);

// Calculate distance between two vectors
float Vector2Distance (Vector2 v1, Vector2 v2);

// Calculate angle from two vectors in X-axis
float Vector2Angle (Vector2 v1, Vector2 v2);

// Scale vector (multiply by value)
Vector2 Vector2Scale (Vector2 v, float scale);

// Multiply vector by vector
Vector2 Vector2MultiplyV (Vector2 v1, Vector2 v2);

// Negate vector
Vector2 Vector2Negate (Vector2 v);

// Divide vector by a float value
Vector2 Vector2Divide (Vector2 v, float div);

// Divide vector by vector
Vector2 Vector2DivideV (Vector2 v1, Vector2 v2);

// Normalize provided vector
Vector2 Vector2Normalize (Vector2 v);

// Calculate linear interpolation between two vectors
Vector2 Vector2Lerp (Vector2 v1, Vector2 v2, float amount);

// Rotate Vector by float in Degrees.
Vector2 Vector2Rotate (Vector2 v, float degs);

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector3 math
//----------------------------------------------------------------------------------

// Vector with components value 0.0f
Vector3 Vector3Zero ();

// Vector with components value 1.0f
Vector3 Vector3One ();

// Add two vectors
Vector3 Vector3Add (Vector3 v1, Vector3 v2);

// Subtract two vectors
Vector3 Vector3Subtract (Vector3 v1, Vector3 v2);

// Multiply vector by scalar
Vector3 Vector3Scale (Vector3 v, float scalar);

// Multiply vector by vector
Vector3 Vector3Multiply (Vector3 v1, Vector3 v2);

// Calculate two vectors cross product
Vector3 Vector3CrossProduct (Vector3 v1, Vector3 v2);

// Calculate one vector perpendicular vector
Vector3 Vector3Perpendicular (Vector3 v);

// Calculate vector length
float Vector3Length (const Vector3 v);

// Calculate two vectors dot product
float Vector3DotProduct (Vector3 v1, Vector3 v2);

// Calculate distance between two vectors
float Vector3Distance (Vector3 v1, Vector3 v2);

// Negate provided vector (invert direction)
Vector3 Vector3Negate (Vector3 v);

// Divide vector by a float value
Vector3 Vector3Divide (Vector3 v, float div);

// Divide vector by vector
Vector3 Vector3DivideV (Vector3 v1, Vector3 v2);

// Normalize provided vector
Vector3 Vector3Normalize (Vector3 v);

// Orthonormalize provided vectors
// Makes vectors normalized and orthogonal to each other
// Gram-Schmidt function implementation
void Vector3OrthoNormalize (Vector3* v1, Vector3* v2);

// Transforms a Vector3 by a given Matrix
Vector3 Vector3Transform (Vector3 v, Matrix mat);

// Transform a vector by quaternion rotation
Vector3 Vector3RotateByQuaternion (Vector3 v, Quaternion q);

// Calculate linear interpolation between two vectors
Vector3 Vector3Lerp (Vector3 v1, Vector3 v2, float amount);

// Calculate reflected vector to normal

// I is the original vector
// N is the normal of the incident plane
// R = I - (2*N*( DotProduct[ I,N] ))
Vector3 Vector3Reflect (Vector3 v, Vector3 normal);

// Return min value for each pair of components
Vector3 Vector3Min (Vector3 v1, Vector3 v2);

// Return max value for each pair of components
Vector3 Vector3Max (Vector3 v1, Vector3 v2);

// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
// NOTE: Assumes P is on the plane of the triangle

//Vector v0 = b - a, v1 = c - a, v2 = p - a;
Vector3 Vector3Barycenter (Vector3 p, Vector3 a, Vector3 b, Vector3 c);

// Returns Vector3 as float array
float3 Vector3ToFloatV (Vector3 v);

//----------------------------------------------------------------------------------
// Module Functions Definition - Matrix math
//----------------------------------------------------------------------------------

// Compute matrix determinant

// Cache the matrix values (speed optimization)
float MatrixDeterminant (Matrix mat);

// Returns the trace of the matrix (sum of the values along the diagonal)
float MatrixTrace (Matrix mat);

// Transposes provided matrix
Matrix MatrixTranspose (Matrix mat);

// Invert provided matrix

// Cache the matrix values (speed optimization)

// Calculate the invert determinant (inlined to avoid double-caching)
Matrix MatrixInvert (Matrix mat);

// Normalize provided matrix
Matrix MatrixNormalize (Matrix mat);

// Returns identity matrix
Matrix MatrixIdentity ();

// Add two matrices
Matrix MatrixAdd (Matrix left, Matrix right);

// Subtract two matrices (left - right)
Matrix MatrixSubtract (Matrix left, Matrix right);

// Returns translation matrix
Matrix MatrixTranslate (float x, float y, float z);

// Create rotation matrix from axis and angle
// NOTE: Angle should be provided in radians
Matrix MatrixRotate (Vector3 axis, float angle);

// Returns xyz-rotation matrix (angles in radians)
Matrix MatrixRotateXYZ (Vector3 ang);

// Returns x-rotation matrix (angle in radians)
Matrix MatrixRotateX (float angle);

// Returns y-rotation matrix (angle in radians)
Matrix MatrixRotateY (float angle);

// Returns z-rotation matrix (angle in radians)
Matrix MatrixRotateZ (float angle);

// Returns scaling matrix
Matrix MatrixScale (float x, float y, float z);

// Returns two matrix multiplication
// NOTE: When multiplying matrices... the order matters!
Matrix MatrixMultiply (Matrix left, Matrix right);

// Returns perspective projection matrix
Matrix MatrixFrustum (
    double left,
    double right,
    double bottom,
    double top,
    double near,
    double far);

// Returns perspective projection matrix
// NOTE: Angle should be provided in radians
Matrix MatrixPerspective (double fovy, double aspect, double near, double far);

// Returns orthographic projection matrix
Matrix MatrixOrtho (
    double left,
    double right,
    double bottom,
    double top,
    double near,
    double far);

// Returns camera look-at matrix (view matrix)
Matrix MatrixLookAt (Vector3 eye, Vector3 target, Vector3 up);

// Returns float array of matrix data
float16 MatrixToFloatV (Matrix mat);

//----------------------------------------------------------------------------------
// Module Functions Definition - Quaternion math
//----------------------------------------------------------------------------------

// Returns identity quaternion
Quaternion QuaternionIdentity ();

// Computes the length of a quaternion
float QuaternionLength (Quaternion q);

// Normalize provided quaternion
Quaternion QuaternionNormalize (Quaternion q);

// Invert provided quaternion
Quaternion QuaternionInvert (Quaternion q);

// Calculate two quaternion multiplication
Quaternion QuaternionMultiply (Quaternion q1, Quaternion q2);

// Calculate linear interpolation between two quaternions
Quaternion QuaternionLerp (Quaternion q1, Quaternion q2, float amount);

// Calculate slerp-optimized interpolation between two quaternions
Quaternion QuaternionNlerp (Quaternion q1, Quaternion q2, float amount);

// Calculates spherical linear interpolation between two quaternions
Quaternion QuaternionSlerp (Quaternion q1, Quaternion q2, float amount);

// Calculate quaternion based on the rotation from one vector to another

// NOTE: Added QuaternioIdentity()

// Normalize to essentially nlerp the original and identity to 0.5

// Above lines are equivalent to:
//Quaternion result = QuaternionNlerp(q, QuaternionIdentity(), 0.5f);
Quaternion QuaternionFromVector3ToVector3 (Vector3 from, Vector3 to);

// Returns a quaternion for a given rotation matrix
Quaternion QuaternionFromMatrix (Matrix mat);

// Returns a matrix for a given quaternion
Matrix QuaternionToMatrix (Quaternion q);

// Returns rotation quaternion for an angle and axis
// NOTE: angle must be provided in radians
Quaternion QuaternionFromAxisAngle (Vector3 axis, float angle);

// Returns the rotation angle and axis for a given quaternion

// This occurs when the angle is zero.
// Not a problem: just set an arbitrary normalized axis.
void QuaternionToAxisAngle (Quaternion q, Vector3* outAxis, float* outAngle);

// Returns he quaternion equivalent to Euler angles
Quaternion QuaternionFromEuler (float roll, float pitch, float yaw);

// Return the Euler angles equivalent to quaternion (roll, pitch, yaw)
// NOTE: Angles are returned in a Vector3 struct in degrees

// roll (x-axis rotation)

// pitch (y-axis rotation)

// yaw (z-axis rotation)
Vector3 QuaternionToEuler (Quaternion q);

// Transform a quaternion given a transformation matrix
Quaternion QuaternionTransform (Quaternion q, Matrix mat);

// RAYMATH_H
/**********************************************************************************************
*
*   rlgl - raylib OpenGL abstraction layer
*
*   rlgl is a wrapper for multiple OpenGL versions (1.1, 2.1, 3.3 Core, ES 2.0) to
*   pseudo-OpenGL 1.1 style functions (rlVertex, rlTranslate, rlRotate...).
*
*   When chosing an OpenGL version greater than OpenGL 1.1, rlgl stores vertex data on internal
*   VBO buffers (and VAOs if available). It requires calling 3 functions:
*       rlglInit()  - Initialize internal buffers and auxiliar resources
*       rlglDraw()  - Process internal buffers and send required draw calls
*       rlglClose() - De-initialize internal buffers data and other auxiliar resources
*
*   CONFIGURATION:
*
*   #define GRAPHICS_API_OPENGL_11
*   #define GRAPHICS_API_OPENGL_21
*   #define GRAPHICS_API_OPENGL_33
*   #define GRAPHICS_API_OPENGL_ES2
*       Use selected OpenGL graphics backend, should be supported by platform
*       Those preprocessor defines are only used on rlgl module, if OpenGL version is
*       required by any other module, use rlGetVersion() tocheck it
*
*   #define RLGL_IMPLEMENTATION
*       Generates the implementation of the library into the included file.
*       If not defined, the library is in header only mode and can be included in other headers
*       or source files without problems. But only ONE file should hold the implementation.
*
*   #define RLGL_STANDALONE
*       Use rlgl as standalone library (no raylib dependency)
*
*   #define SUPPORT_VR_SIMULATOR
*       Support VR simulation functionality (stereo rendering)
*
*   DEPENDENCIES:
*       raymath     - 3D math functionality (Vector3, Matrix, Quaternion)
*       GLAD        - OpenGL extensions loading (OpenGL 3.3 Core only)
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2014-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

extern (C):

// We are building or using rlgl as a static library (or Linux shared library)

// We are building raylib as a Win32 shared library (.dll)

// We are using raylib as a Win32 shared library (.dll)

// Support TRACELOG macros

// Allow custom memory allocators

// Required for: Model, Shader, Texture2D, TRACELOG()

// Required for: Vector3, Matrix

// Security check in case no GRAPHICS_API_OPENGL_* defined

// Security check in case multiple GRAPHICS_API_OPENGL_* defined

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
// This is the maximum amount of elements (quads) per batch
// NOTE: Be careful with text, every letter maps to a quad
enum MAX_BATCH_ELEMENTS = 8192;

// We reduce memory sizes for embedded systems (RPI and HTML5)
// NOTE: On HTML5 (emscripten) this is allocated on heap, by default it's only 16MB!...just take care...

enum MAX_BATCH_BUFFERING = 1; // Max number of buffers for batching (multi-buffering)

enum MAX_MATRIX_STACK_SIZE = 32; // Max size of Matrix stack
enum MAX_DRAWCALL_REGISTERED = 256; // Max draws by state changes (mode, texture)

enum DEFAULT_NEAR_CULL_DISTANCE = 0.01; // Default near cull distance

enum DEFAULT_FAR_CULL_DISTANCE = 1000.0; // Default far cull distance

// Shader and material limits
enum MAX_SHADER_LOCATIONS = 32; // Maximum number of predefined locations stored in shader struct
enum MAX_MATERIAL_MAPS = 12; // Maximum number of texture maps stored in shader struct

// Texture parameters (equivalent to OpenGL defines)
enum RL_TEXTURE_WRAP_S = 0x2802; // GL_TEXTURE_WRAP_S
enum RL_TEXTURE_WRAP_T = 0x2803; // GL_TEXTURE_WRAP_T
enum RL_TEXTURE_MAG_FILTER = 0x2800; // GL_TEXTURE_MAG_FILTER
enum RL_TEXTURE_MIN_FILTER = 0x2801; // GL_TEXTURE_MIN_FILTER
enum RL_TEXTURE_ANISOTROPIC_FILTER = 0x3000; // Anisotropic filter (custom identifier)

enum RL_FILTER_NEAREST = 0x2600; // GL_NEAREST
enum RL_FILTER_LINEAR = 0x2601; // GL_LINEAR
enum RL_FILTER_MIP_NEAREST = 0x2700; // GL_NEAREST_MIPMAP_NEAREST
enum RL_FILTER_NEAREST_MIP_LINEAR = 0x2702; // GL_NEAREST_MIPMAP_LINEAR
enum RL_FILTER_LINEAR_MIP_NEAREST = 0x2701; // GL_LINEAR_MIPMAP_NEAREST
enum RL_FILTER_MIP_LINEAR = 0x2703; // GL_LINEAR_MIPMAP_LINEAR

enum RL_WRAP_REPEAT = 0x2901; // GL_REPEAT
enum RL_WRAP_CLAMP = 0x812F; // GL_CLAMP_TO_EDGE
enum RL_WRAP_MIRROR_REPEAT = 0x8370; // GL_MIRRORED_REPEAT
enum RL_WRAP_MIRROR_CLAMP = 0x8742; // GL_MIRROR_CLAMP_EXT

// Matrix modes (equivalent to OpenGL)
enum RL_MODELVIEW = 0x1700; // GL_MODELVIEW
enum RL_PROJECTION = 0x1701; // GL_PROJECTION
enum RL_TEXTURE = 0x1702; // GL_TEXTURE

// Primitive assembly draw modes
enum RL_LINES = 0x0001; // GL_LINES
enum RL_TRIANGLES = 0x0004; // GL_TRIANGLES
enum RL_QUADS = 0x0007; // GL_QUADS

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
enum GlVersion
{
    OPENGL_11 = 1,
    OPENGL_21 = 2,
    OPENGL_33 = 3,
    OPENGL_ES_20 = 4
}

// Boolean type

// Color type, RGBA (32bit)

// Rectangle type

// Texture2D type
// NOTE: Data stored in GPU memory

// OpenGL texture id
// Texture base width
// Texture base height
// Mipmap levels, 1 by default
// Data format (PixelFormat)

// Texture type, same as Texture2D

// TextureCubemap type, actually, same as Texture2D

// RenderTexture2D type, for texture rendering

// OpenGL framebuffer (fbo) id
// Color buffer attachment texture
// Depth buffer attachment texture
// Track if depth attachment is a texture or renderbuffer

// RenderTexture type, same as RenderTexture2D

// Vertex data definning a mesh

// number of vertices stored in arrays
// number of triangles stored (indexed or not)
// vertex position (XYZ - 3 components per vertex) (shader-location = 0)
// vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
// vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
// vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
// vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
// vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
// vertex indices (in case vertex data comes indexed)

// Animation vertex data
// Animated vertex positions (after bones transformations)
// Animated normals (after bones transformations)
// Vertex bone ids, up to 4 bones influence by vertex (skinning)
// Vertex bone weight, up to 4 bones influence by vertex (skinning)

// OpenGL identifiers
// OpenGL Vertex Array Object id
// OpenGL Vertex Buffer Objects id (7 types of vertex data)

// Shader and material limits

// Shader type (generic)

// Shader program id
// Shader locations array (MAX_SHADER_LOCATIONS)

// Material texture map

// Material map texture
// Material map color
// Material map value

// Material type (generic)

// Material shader
// Material maps (MAX_MATERIAL_MAPS)
// Material generic parameters (if required)

// Camera type, defines a camera position/orientation in 3d space

// Camera position
// Camera target it looks-at
// Camera up vector (rotation over its axis)
// Camera field-of-view apperture in Y (degrees)

// Head-Mounted-Display device parameters

// HMD horizontal resolution in pixels
// HMD vertical resolution in pixels
// HMD horizontal size in meters
// HMD vertical size in meters
// HMD screen center in meters
// HMD distance between eye and display in meters
// HMD lens separation distance in meters
// HMD IPD (distance between pupils) in meters
// HMD lens distortion constant parameters
// HMD chromatic aberration correction parameters

// VR Stereo rendering configuration for simulator

// VR stereo rendering distortion shader
// VR stereo rendering eyes projection matrices
// VR stereo rendering eyes view offset matrices
// VR stereo rendering right eye viewport [x, y, w, h]
// VR stereo rendering left eye viewport [x, y, w, h]

// TraceLog message types

// Texture formats (support depends on OpenGL version)

// 8 bit per pixel (no alpha)

// 16 bpp
// 24 bpp
// 16 bpp (1 bit alpha)
// 16 bpp (4 bit alpha)
// 32 bpp
// 32 bpp (1 channel - float)
// 32*3 bpp (3 channels - float)
// 32*4 bpp (4 channels - float)
// 4 bpp (no alpha)
// 4 bpp (1 bit alpha)
// 8 bpp
// 8 bpp
// 4 bpp
// 4 bpp
// 8 bpp
// 4 bpp
// 4 bpp
// 8 bpp
// 2 bpp

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification

// No filter, just pixel aproximation
// Linear filtering
// Trilinear filtering (linear with mipmaps)
// Anisotropic filtering 4x
// Anisotropic filtering 8x
// Anisotropic filtering 16x

// Color blending modes (pre-defined)

// Shader location point type

// LOC_MAP_DIFFUSE
// LOC_MAP_SPECULAR

// Shader uniform data types

// Material map type

// MAP_DIFFUSE
// MAP_SPECULAR

// NOTE: Uses GL_TEXTURE_CUBE_MAP
// NOTE: Uses GL_TEXTURE_CUBE_MAP
// NOTE: Uses GL_TEXTURE_CUBE_MAP

// Prevents name mangling of functions

//------------------------------------------------------------------------------------
// Functions Declaration - Matrix operations
//------------------------------------------------------------------------------------
void rlMatrixMode (int mode); // Choose the current matrix to be transformed
void rlPushMatrix (); // Push the current matrix to stack
void rlPopMatrix (); // Pop lattest inserted matrix from stack
void rlLoadIdentity (); // Reset current matrix to identity matrix
void rlTranslatef (float x, float y, float z); // Multiply the current matrix by a translation matrix
void rlRotatef (float angleDeg, float x, float y, float z); // Multiply the current matrix by a rotation matrix
void rlScalef (float x, float y, float z); // Multiply the current matrix by a scaling matrix
void rlMultMatrixf (float* matf); // Multiply the current matrix by another matrix
void rlFrustum (double left, double right, double bottom, double top, double znear, double zfar);
void rlOrtho (double left, double right, double bottom, double top, double znear, double zfar);
void rlViewport (int x, int y, int width, int height); // Set the viewport area

//------------------------------------------------------------------------------------
// Functions Declaration - Vertex level operations
//------------------------------------------------------------------------------------
void rlBegin (int mode); // Initialize drawing mode (how to organize vertex)
void rlEnd (); // Finish vertex providing
void rlVertex2i (int x, int y); // Define one vertex (position) - 2 int
void rlVertex2f (float x, float y); // Define one vertex (position) - 2 float
void rlVertex3f (float x, float y, float z); // Define one vertex (position) - 3 float
void rlTexCoord2f (float x, float y); // Define one vertex (texture coordinate) - 2 float
void rlNormal3f (float x, float y, float z); // Define one vertex (normal) - 3 float
void rlColor4ub (ubyte r, ubyte g, ubyte b, ubyte a); // Define one vertex (color) - 4 byte
void rlColor3f (float x, float y, float z); // Define one vertex (color) - 3 float
void rlColor4f (float x, float y, float z, float w); // Define one vertex (color) - 4 float

//------------------------------------------------------------------------------------
// Functions Declaration - OpenGL equivalent functions (common to 1.1, 3.3+, ES2)
// NOTE: This functions are used to completely abstract raylib code from OpenGL layer
//------------------------------------------------------------------------------------
void rlEnableTexture (uint id); // Enable texture usage
void rlDisableTexture (); // Disable texture usage
void rlTextureParameters (uint id, int param, int value); // Set texture parameters (filter, wrap)
void rlEnableRenderTexture (uint id); // Enable render texture (fbo)
void rlDisableRenderTexture (); // Disable render texture (fbo), return to default framebuffer
void rlEnableDepthTest (); // Enable depth test
void rlDisableDepthTest (); // Disable depth test
void rlEnableBackfaceCulling (); // Enable backface culling
void rlDisableBackfaceCulling (); // Disable backface culling
void rlEnableScissorTest (); // Enable scissor test
void rlDisableScissorTest (); // Disable scissor test
void rlScissor (int x, int y, int width, int height); // Scissor test
void rlEnableWireMode (); // Enable wire mode
void rlDisableWireMode (); // Disable wire mode
void rlDeleteTextures (uint id); // Delete OpenGL texture from GPU
void rlDeleteRenderTextures (RenderTexture2D target); // Delete render textures (fbo) from GPU
void rlDeleteShader (uint id); // Delete OpenGL shader program from GPU
void rlDeleteVertexArrays (uint id); // Unload vertex data (VAO) from GPU memory
void rlDeleteBuffers (uint id); // Unload vertex data (VBO) from GPU memory
void rlClearColor (ubyte r, ubyte g, ubyte b, ubyte a); // Clear color buffer with color
void rlClearScreenBuffers (); // Clear used screen buffers (color and depth)
void rlUpdateBuffer (int bufferId, void* data, int dataSize); // Update GPU buffer with new data
uint rlLoadAttribBuffer (uint vaoId, int shaderLoc, void* buffer, int size, bool dynamic); // Load a new attributes buffer

//------------------------------------------------------------------------------------
// Functions Declaration - rlgl functionality
//------------------------------------------------------------------------------------
void rlglInit (int width, int height); // Initialize rlgl (buffers, shaders, textures, states)
void rlglClose (); // De-inititialize rlgl (buffers, shaders, textures)
void rlglDraw (); // Update and draw default internal buffers

int rlGetVersion (); // Returns current OpenGL version
bool rlCheckBufferLimit (int vCount); // Check internal buffer overflow for a given number of vertex
void rlSetDebugMarker (const(char)* text); // Set debug marker for analysis
void rlLoadExtensions (void* loader); // Load OpenGL extensions
Vector3 rlUnproject (Vector3 source, Matrix proj, Matrix view); // Get world coordinates from screen coordinates

// Textures data management
uint rlLoadTexture (void* data, int width, int height, int format, int mipmapCount); // Load texture in GPU
uint rlLoadTextureDepth (int width, int height, int bits, bool useRenderBuffer); // Load depth texture/renderbuffer (to be attached to fbo)
uint rlLoadTextureCubemap (void* data, int size, int format); // Load texture cubemap
void rlUpdateTexture (uint id, int width, int height, int format, const(void)* data); // Update GPU texture with new data
void rlGetGlTextureFormats (int format, uint* glInternalFormat, uint* glFormat, uint* glType); // Get OpenGL internal formats
void rlUnloadTexture (uint id); // Unload texture from GPU memory

void rlGenerateMipmaps (Texture2D* texture); // Generate mipmap data for selected texture
void* rlReadTexturePixels (Texture2D texture); // Read texture pixel data
ubyte* rlReadScreenPixels (int width, int height); // Read screen pixel data (color buffer)

// Render texture management (fbo)
RenderTexture2D rlLoadRenderTexture (int width, int height, int format, int depthBits, bool useDepthTexture); // Load a render texture (with color and depth attachments)
void rlRenderTextureAttach (RenderTexture target, uint id, int attachType); // Attach texture/renderbuffer to an fbo
bool rlRenderTextureComplete (RenderTexture target); // Verify render texture is complete

// Vertex data management
void rlLoadMesh (Mesh* mesh, bool dynamic); // Upload vertex data into GPU and provided VAO/VBO ids
void rlUpdateMesh (Mesh mesh, int buffer, int num); // Update vertex or index data on GPU (upload new data to one buffer)
void rlUpdateMeshAt (Mesh mesh, int buffer, int num, int index); // Update vertex or index data on GPU, at index
void rlDrawMesh (Mesh mesh, Material material, Matrix transform); // Draw a 3d mesh with material and transform
void rlUnloadMesh (Mesh mesh); // Unload mesh data from CPU and GPU

// NOTE: There is a set of shader related functions that are available to end user,
// to avoid creating function wrappers through core module, they have been directly declared in raylib.h

//------------------------------------------------------------------------------------
// Shaders System Functions (Module: rlgl)
// NOTE: This functions are useless when using OpenGL 1.1
//------------------------------------------------------------------------------------
// Shader loading/unloading functions
// Load shader from files and bind default locations
// Load shader from code strings and bind default locations
// Unload shader from GPU memory (VRAM)

// Get default shader
// Get default texture
// Get texture to draw shapes
// Get texture rectangle to draw shapes

// Shader configuration functions
// Get shader uniform location
// Set shader uniform value
// Set shader uniform value vector
// Set shader uniform value (matrix 4x4)
// Set a custom projection matrix (replaces internal projection matrix)
// Set a custom modelview matrix (replaces internal modelview matrix)
// Get internal modelview matrix

// Texture maps generation (PBR)
// NOTE: Required shaders should be provided
// Generate cubemap texture from HDR texture
// Generate irradiance texture using cubemap data
// Generate prefilter texture using cubemap data
// Generate BRDF texture using cubemap data

// Shading begin/end functions
// Begin custom shader drawing
// End custom shader drawing (use default shader)
// Begin blending mode (alpha, additive, multiplied)
// End blending mode (reset to default: alpha blending)

// VR control functions
// Init VR simulator for selected device parameters
// Close VR simulator for current device
// Update VR tracking (position and orientation) and camera
// Set stereo rendering configuration parameters
// Detect if VR simulator is ready
// Enable/Disable VR experience
// Begin VR simulator stereo rendering
// End VR simulator stereo rendering

// Load chars array from text file
// Get pixel data size in bytes (image or texture)

// RLGL_H

/***********************************************************************************
*
*   RLGL IMPLEMENTATION
*
************************************************************************************/

// Required for: fopen(), fseek(), fread(), fclose() [LoadFileText]

// Check if config flags have been externally provided on compilation line

// Defines module configuration flags

// Required for: Vector3 and Matrix functions

// Required for: malloc(), free()
// Required for: strcmp(), strlen() [Used in rlglInit(), on extensions loading]
// Required for: atan2f(), fabs()

// OpenGL 1.1 library for OSX

// APIENTRY for OpenGL function pointer declarations is required

// WINGDIAPI definition. Some Windows OpenGL headers need it

// OpenGL 1.1 library

// OpenGL 2.1 uses mostly OpenGL 3.3 Core functionality

// OpenGL 3 library for OSX
// OpenGL 3 extensions library for OSX

// GLAD extensions loading library, includes OpenGL headers

// GLAD extensions loading library, includes OpenGL headers

// EGL library
// OpenGL ES 2.0 library
// OpenGL ES 2.0 extensions library

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------

// Default vertex attribute names on shader to set location points
// shader-location = 0
// shader-location = 1
// shader-location = 2
// shader-location = 3
// shader-location = 4
// shader-location = 5

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------

// Dynamic vertex buffers (position + texcoords + colors + indices arrays)

// vertex position counter to process (and draw) from full buffer
// vertex texcoord counter to process (and draw) from full buffer
// vertex color counter to process (and draw) from full buffer

// vertex position (XYZ - 3 components per vertex) (shader-location = 0)
// vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
// vertex colors (RGBA - 4 components per vertex) (shader-location = 3)

// vertex indices (in case vertex data comes indexed) (6 indices per quad)

// vertex indices (in case vertex data comes indexed) (6 indices per quad)

// OpenGL Vertex Array Object id
// OpenGL Vertex Buffer Objects id (4 types of vertex data)

// Draw call type

// Drawing mode: LINES, TRIANGLES, QUADS
// Number of vertex of the draw
// Number of vertex required for index alignment (LINES, TRIANGLES)
//unsigned int vaoId;         // Vertex array id to be used on the draw
//unsigned int shaderId;      // Shader id to be used on the draw
// Texture id to be used on the draw

//Matrix projection;        // Projection matrix for this draw
//Matrix modelview;         // Modelview matrix for this draw

// VR Stereo rendering configuration for simulator

// VR stereo rendering distortion shader
// VR stereo rendering eyes projection matrices
// VR stereo rendering eyes view offset matrices
// VR stereo rendering right eye viewport [x, y, w, h]
// VR stereo rendering left eye viewport [x, y, w, h]

// Current matrix mode
// Current matrix pointer
// Default modelview matrix
// Default projection matrix
// Transform matrix to be used with rlTranslate, rlRotate, rlScale
// Use transform matrix against vertex (if required)
// Matrix stack for push/pop
// Matrix stack counter

// Default dynamic buffer for elements data
// Current buffer tracking, multi-buffering system is supported
// Draw calls array
// Draw calls counter

// Texture used on shapes drawing (usually a white)
// Texture source rectangle used on shapes drawing
// Default texture used on shapes/poly drawing (required by shader)
// Default vertex shader id (used by default shader program)
// Default fragment shader Id (used by default shader program)
// Basic shader, support vertex color and diffuse texture
// Shader to be used on rendering (by default, defaultShader)
// Current depth value

// Default framebuffer width
// Default framebuffer height

// VAO support (OpenGL ES2 could not support VAO extension)
// NPOT textures full support
// Depth textures supported
// float textures support (32 bit per channel)
// DDS texture compression support
// ETC1 texture compression support
// ETC2/EAC texture compression support
// PVR texture compression support
// ASTC texture compression support
// Clamp mirror wrap mode supported
// Anisotropic texture filtering support
// Debug marker support

// Maximum anisotropy level supported (minimum is 2.0f)
// Maximum bits for depth component

// Extensions supported flags

// VR stereo configuration for simulator
// VR stereo rendering framebuffer
// VR simulator ready flag
// VR stereo rendering enabled/disabled flag

// SUPPORT_VR_SIMULATOR

// GRAPHICS_API_OPENGL_33 || GRAPHICS_API_OPENGL_ES2

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------

// GRAPHICS_API_OPENGL_33 || GRAPHICS_API_OPENGL_ES2

// NOTE: VAO functionality is exposed through extensions (OES)
// Entry point pointer to function glGenVertexArrays()
// Entry point pointer to function glBindVertexArray()
// Entry point pointer to function glDeleteVertexArrays()

//----------------------------------------------------------------------------------
// Module specific Functions Declaration
//----------------------------------------------------------------------------------

// Compile custom shader and return shader id
// Load custom shader program

// Load default shader (just vertex positioning and texture coloring)
// Bind default shader locations (attributes and uniforms)
// Unload default shader

// Load default internal buffers
// Update default internal buffers (VAOs/VBOs) with vertex data
// Draw default internal buffers vertex data
// Unload default internal buffers vertex data from CPU and GPU

// Generate and draw cube
// Generate and draw quad

// Set internal projection and modelview matrix depending on eye

// GRAPHICS_API_OPENGL_33 || GRAPHICS_API_OPENGL_ES2

//----------------------------------------------------------------------------------
// Module Functions Definition - Matrix operations
//----------------------------------------------------------------------------------

// Fallback to OpenGL 1.1 function calls
//---------------------------------------

// Choose the current matrix to be transformed

//else if (mode == RL_TEXTURE) // Not supported

// Push the current matrix into RLGL.State.stack

// Pop lattest inserted matrix from RLGL.State.stack

// Reset current matrix to identity matrix

// Multiply the current matrix by a translation matrix

// NOTE: We transpose matrix with multiplication order

// Multiply the current matrix by a rotation matrix

// NOTE: We transpose matrix with multiplication order

// Multiply the current matrix by a scaling matrix

// NOTE: We transpose matrix with multiplication order

// Multiply the current matrix by another matrix

// Matrix creation from array

// Multiply the current matrix by a perspective matrix generated by parameters

// Multiply the current matrix by an orthographic matrix generated by parameters

// Set the viewport area (transformation from normalized device coordinates to window coordinates)
// NOTE: Updates global variables: RLGL.State.framebufferWidth, RLGL.State.framebufferHeight

//----------------------------------------------------------------------------------
// Module Functions Definition - Vertex level operations
//----------------------------------------------------------------------------------

// Fallback to OpenGL 1.1 function calls
//---------------------------------------

// Initialize drawing mode (how to organize vertex)

// Draw mode can be RL_LINES, RL_TRIANGLES and RL_QUADS
// NOTE: In all three cases, vertex are accumulated over default internal vertex buffer

// Make sure current RLGL.State.draws[i].vertexCount is aligned a multiple of 4,
// that way, following QUADS drawing will keep aligned with index processing
// It implies adding some extra alignment vertex at the end of the draw,
// those vertex are not processed but they are considered as an additional offset
// for the next set of vertex to be drawn

// Finish vertex providing

// Make sure vertexCount is the same for vertices, texcoords, colors and normals
// NOTE: In OpenGL 1.1, one glColor call can be made for all the subsequent glVertex calls

// Make sure colors count match vertex count

// Make sure texcoords count match vertex count

// TODO: Make sure normals count match vertex count... if normals support is added in a future... :P

// NOTE: Depth increment is dependant on rlOrtho(): z-near and z-far values,
// as well as depth buffer bit-depth (16bit or 24bit or 32bit)
// Correct increment formula would be: depthInc = (zfar - znear)/pow(2, bits)

// Verify internal buffers limits
// NOTE: This check is combined with usage of rlCheckBufferLimit()

// WARNING: If we are between rlPushMatrix() and rlPopMatrix() and we need to force a rlglDraw(),
// we need to call rlPopMatrix() before to recover *RLGL.State.currentMatrix (RLGL.State.modelview) for the next forced draw call!
// If we have multiple matrix pushed, it will require "RLGL.State.stackCounter" pops before launching the draw

// Define one vertex (position)
// NOTE: Vertex position data is the basic information required for drawing

// Transform provided vector if required

// Verify that MAX_BATCH_ELEMENTS limit not reached

// Define one vertex (position)

// Define one vertex (position)

// Define one vertex (texture coordinate)
// NOTE: Texture coordinates are limited to QUADS only

// Define one vertex (normal)
// NOTE: Normals limited to TRIANGLES only?

// TODO: Normals usage...

// Define one vertex (color)

// Define one vertex (color)

// Define one vertex (color)

//----------------------------------------------------------------------------------
// Module Functions Definition - OpenGL equivalent functions (common to 1.1, 3.3+, ES2)
//----------------------------------------------------------------------------------

// Enable texture usage

// Make sure current RLGL.State.draws[i].vertexCount is aligned a multiple of 4,
// that way, following QUADS drawing will keep aligned with index processing
// It implies adding some extra alignment vertex at the end of the draw,
// those vertex are not processed but they are considered as an additional offset
// for the next set of vertex to be drawn

// Disable texture usage

// NOTE: If quads batch limit is reached,
// we force a draw call and next batch starts

// Set texture parameters (wrap mode/filter mode)

// Enable rendering to texture (fbo)

//glDisable(GL_CULL_FACE);    // Allow double side drawing for texture flipping
//glCullFace(GL_FRONT);

// Disable rendering to texture

//glEnable(GL_CULL_FACE);
//glCullFace(GL_BACK);

// Enable depth test

// Disable depth test

// Enable backface culling

// Disable backface culling

// Enable scissor test

// Disable scissor test

// Scissor test

// Enable wire mode

// NOTE: glPolygonMode() not available on OpenGL ES

// Disable wire mode

// NOTE: glPolygonMode() not available on OpenGL ES

// Unload texture from GPU memory

// Unload render texture from GPU memory

// Unload shader from GPU memory

// Unload vertex data (VAO) from GPU memory

// Unload vertex data (VBO) from GPU memory

// Clear color buffer with color

// Color values clamp to 0.0f(0) and 1.0f(255)

// Clear used screen buffers (color and depth)

// Clear used buffers: Color and Depth (Depth is used for 3D)
//glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);     // Stencil buffer not used...

// Update GPU buffer with new data

//----------------------------------------------------------------------------------
// Module Functions Definition - rlgl Functions
//----------------------------------------------------------------------------------

// Initialize rlgl: OpenGL extensions, default buffers/shaders/textures, OpenGL states

// Check OpenGL information and capabilities
//------------------------------------------------------------------------------
// Print current OpenGL and GLSL version

// NOTE: We can get a bunch of extra information about GPU capabilities (glGet*)
//int maxTexSize;
//glGetIntegerv(GL_MAX_TEXTURE_SIZE, &maxTexSize);
//TRACELOG(LOG_INFO, "GL: Maximum texture size: %i", maxTexSize);

//GL_MAX_TEXTURE_IMAGE_UNITS
//GL_MAX_VIEWPORT_DIMS

//int numAuxBuffers;
//glGetIntegerv(GL_AUX_BUFFERS, &numAuxBuffers);
//TRACELOG(LOG_INFO, "GL: Number of aixiliar buffers: %i", numAuxBuffers);

//GLint numComp = 0;
//GLint format[32] = { 0 };
//glGetIntegerv(GL_NUM_COMPRESSED_TEXTURE_FORMATS, &numComp);
//glGetIntegerv(GL_COMPRESSED_TEXTURE_FORMATS, format);
//for (int i = 0; i < numComp; i++) TRACELOG(LOG_INFO, "GL: Supported compressed format: 0x%x", format[i]);

// NOTE: We don't need that much data on screen... right now...

// TODO: Automatize extensions loading using rlLoadExtensions() and GLAD
// Actually, when rlglInit() is called in InitWindow() in core.c,
// OpenGL required extensions have already been loaded (PLATFORM_DESKTOP)

// Get supported extensions list

// NOTE: On OpenGL 3.3 VAO and NPOT are supported by default

// Multiple texture extensions supported by default

// We get a list of available extensions and we check for some of them (compressed textures)
// NOTE: We don't need to check again supported extensions but we do (GLAD already dealt with that)

// Allocate numExt strings pointers

// Get extensions strings

// Allocate 512 strings pointers (2 KB)

// One big const string

// NOTE: We have to duplicate string because glGetString() returns a const string

// NOTE: Duplicated string (extensionsDup) must be deallocated

// Show supported extensions
//for (int i = 0; i < numExt; i++)  TRACELOG(LOG_INFO, "Supported extension: %s", extList[i]);

// Check required extensions

// Check VAO support
// NOTE: Only check on OpenGL ES, OpenGL 3.3 has VAO support as core feature

// The extension is supported by our hardware and driver, try to get related functions pointers
// NOTE: emscripten does not support VAOs natively, it uses emulation and it reduces overall performance...

//glIsVertexArray = (PFNGLISVERTEXARRAYOESPROC)eglGetProcAddress("glIsVertexArrayOES");     // NOTE: Fails in WebGL, omitted

// Check NPOT textures support
// NOTE: Only check on OpenGL ES, OpenGL 3.3 has NPOT textures full support as core feature

// Check texture float support

// Check depth texture support

// DDS texture compression support

// ETC1 texture compression support

// ETC2/EAC texture compression support

// PVR texture compression support

// ASTC texture compression support

// Anisotropic texture filter support

// GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT

// Clamp mirror wrap mode supported

// Debug marker support

// Free extensions pointers

// Duplicated string must be deallocated

// Initialize buffers, default shaders and default textures
//----------------------------------------------------------
// Init default white texture
// 1 pixel RGBA (4 bytes)

// Init default Shader (customized for GL 3.3 and ES2)

// Init default vertex arrays buffers

// Init transformations matrix accumulator

// Init draw calls tracking system

//RLGL.State.draws[i].vaoId = 0;
//RLGL.State.draws[i].shaderId = 0;

//RLGL.State.draws[i].RLGL.State.projection = MatrixIdentity();
//RLGL.State.draws[i].RLGL.State.modelview = MatrixIdentity();

// Init RLGL.State.stack matrices (emulating OpenGL 1.1)

// Init RLGL.State.projection and RLGL.State.modelview matrices

// GRAPHICS_API_OPENGL_33 || GRAPHICS_API_OPENGL_ES2

// Initialize OpenGL default states
//----------------------------------------------------------
// Init state: Depth test
// Type of depth testing to apply
// Disable depth testing for 2D (only used for 3D)

// Init state: Blending mode
// Color blending function (how colors are mixed)
// Enable color blending (required to work with transparencies)

// Init state: Culling
// NOTE: All shapes/models triangles are drawn CCW
// Cull the back face (default)
// Front face are defined counter clockwise (default)
// Enable backface culling

// Init state: Color hints (deprecated in OpenGL 3.0+)
// Improve quality of color and texture coordinate interpolation
// Smooth shading between vertex (vertex colors interpolation)

// Init state: Color/Depth buffers clear
// Set clear color (black)
// Set clear depth value (default)
// Clear color and depth buffers (depth buffer required for 3D)

// Store screen size into global variables

// Init texture and rectangle used on basic shapes drawing

// Vertex Buffer Object deinitialization (memory free)

// Unload default shader
// Unload default buffers
// Unload default texture

// Update and draw internal buffers

// Only process data if we have data to process

// NOTE: Stereo rendering is checked inside

// Returns current OpenGL version

// NOTE: Force OpenGL 3.3 on OSX

// Check internal buffer overflow for a given number of vertex

// Set debug marker

// Load OpenGL extensions
// NOTE: External loader function could be passed as a pointer

// NOTE: glad is generated and contains only required OpenGL 3.3 Core extensions (and lower versions)

// With GLAD, we can check if an extension is supported using the GLAD_GL_xxx booleans
//if (GLAD_GL_ARB_vertex_array_object) // Use GL_ARB_vertex_array_object

// Get world coordinates from screen coordinates

// Calculate unproject matrix (multiply view patrix by projection matrix) and invert it

// Create quaternion from source point

// Multiply quat point by unproject matrix

// Normalized world points in vectors

// Convert image data to OpenGL texture (returns OpenGL valid Id)

// Free any old binding

// Check texture format support by OpenGL 1.1 (compressed textures not supported)

// GRAPHICS_API_OPENGL_11

// Generate texture id

//glActiveTexture(GL_TEXTURE0);     // If not defined, using GL_TEXTURE0 by default (shader texture)

// Mipmap data offset

// Load the different mipmap levels

// Security check for NPOT textures

// Texture parameters configuration
// NOTE: glTexParameteri does NOT affect texture uploading, just the way it's used

// NOTE: OpenGL ES 2.0 with no GL_OES_texture_npot support (i.e. WebGL) has limited NPOT support, so CLAMP_TO_EDGE must be used

// Set texture to repeat on x-axis
// Set texture to repeat on y-axis

// NOTE: If using negative texture coordinates (LoadOBJ()), it does not work!
// Set texture to clamp on x-axis
// Set texture to clamp on y-axis

// Set texture to repeat on x-axis
// Set texture to repeat on y-axis

// Magnification and minification filters
// Alternative: GL_LINEAR
// Alternative: GL_LINEAR

// Activate Trilinear filtering if mipmaps are available

// At this point we have the texture loaded in GPU and texture parameters configured

// NOTE: If mipmaps were not in data, they are not generated automatically

// Unbind current texture

// Load depth texture/renderbuffer (to be attached to fbo)
// WARNING: OpenGL ES 2.0 requires GL_OES_depth_texture/WEBGL_depth_texture extensions

// Create the renderbuffer that will serve as the depth attachment for the framebuffer
// NOTE: A renderbuffer is simpler than a texture and could offer better performance on embedded devices

// Load texture cubemap
// NOTE: Cubemap data is expected to be 6 images in a single column,
// expected the following convention: +X, -X, +Y, -Y, +Z, -Z

// Load cubemap faces

// Set cubemap texture sampling parameters

// Flag not supported on OpenGL ES 2.0

// Update already loaded texture in GPU with new data
// NOTE: We don't know safely if internal texture format is the expected one...

// Get OpenGL internal formats and data type from raylib PixelFormat

// NOTE: on OpenGL ES 2.0 (WebGL), internalFormat must match format and options allowed are: GL_LUMINANCE, GL_RGB, GL_RGBA

// NOTE: Requires extension OES_texture_float
// NOTE: Requires extension OES_texture_float
// NOTE: Requires extension OES_texture_float

// NOTE: Requires OpenGL ES 2.0 or OpenGL 4.3
// NOTE: Requires OpenGL ES 3.0 or OpenGL 4.3
// NOTE: Requires OpenGL ES 3.0 or OpenGL 4.3
// NOTE: Requires PowerVR GPU
// NOTE: Requires PowerVR GPU
// NOTE: Requires OpenGL ES 3.1 or OpenGL 4.3
// NOTE: Requires OpenGL ES 3.1 or OpenGL 4.3

// Unload texture from GPU memory

// Load a texture to be used for rendering (fbo with default color and depth attachments)
// NOTE: If colorFormat or depthBits are no supported, no attachment is done

// Create the framebuffer object

// Create fbo color texture attachment
//-----------------------------------------------------------------------------------------------------

// WARNING: Some texture formats are not supported for fbo color attachment

//-----------------------------------------------------------------------------------------------------

// Create fbo depth renderbuffer/texture
//-----------------------------------------------------------------------------------------------------

//DEPTH_COMPONENT_24BIT?

//-----------------------------------------------------------------------------------------------------

// Attach color texture and depth renderbuffer to FBO
//-----------------------------------------------------------------------------------------------------
// COLOR attachment
// DEPTH attachment
//-----------------------------------------------------------------------------------------------------

// Check if fbo is complete with attachments (valid)
//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------

// Attach color buffer texture to an fbo (unloads previous attachment)
// NOTE: Attach type: 0-Color, 1-Depth renderbuffer, 2-Depth texture

// Verify render texture is complete

// Generate mipmap data for selected texture

// Check if texture is power-of-two (POT)

// WARNING: Manual mipmap generation only works for RGBA 32bit textures!

// Retrieve texture data from VRAM

// NOTE: data size is reallocated to fit mipmaps data
// NOTE: CPU mipmap generation only supports RGBA 32bit data

// Load the mipmaps

// Once mipmaps have been generated and data has been uploaded to GPU VRAM, we can discard RAM data

//glHint(GL_GENERATE_MIPMAP_HINT, GL_DONT_CARE);   // Hint for mipmaps generation algorythm: GL_FASTEST, GL_NICEST, GL_DONT_CARE
// Generate mipmaps automatically

// Activate Trilinear filtering for mipmaps

// Upload vertex data into a VAO (if supported) and VBO

// Check if mesh has already been loaded in GPU

// Vertex Array Object
// Vertex positions VBO
// Vertex texcoords VBO
// Vertex normals VBO
// Vertex colors VBO
// Vertex tangents VBO
// Vertex texcoords2 VBO
// Vertex indices VBO

// Initialize Quads VAO (Buffer A)

// NOTE: Attributes must be uploaded considering default locations points

// Enable vertex attributes: position (shader-location = 0)

// Enable vertex attributes: texcoords (shader-location = 1)

// Enable vertex attributes: normals (shader-location = 2)

// Default color vertex attribute set to WHITE

// Default color vertex attribute (shader-location = 3)

// Default color vertex attribute set to WHITE

// Default tangent vertex attribute (shader-location = 4)

// Default tangents vertex attribute

// Default texcoord2 vertex attribute (shader-location = 5)

// Default texcoord2 vertex attribute

// Load a new attributes buffer

// Update vertex or index data on GPU (upload new data to one buffer)

// Update vertex or index data on GPU, at index
// WARNING: error checking is in place that will cause the data to not be
//          updated if offset + size exceeds what the buffer can hold

// Activate mesh VAO

// Update vertices (vertex position)

// Update texcoords (vertex texture coordinates)

// Update normals (vertex normals)

// Update colors (vertex colors)

// Update tangents (vertex tangents)

// Update texcoords2 (vertex second texture coordinates)

// Update indices (triangle index buffer)

// the * 3 is because each triangle has 3 indices

// Unbind the current VAO

// Another option would be using buffer mapping...
//mesh.vertices = glMapBuffer(GL_ARRAY_BUFFER, GL_READ_WRITE);
// Now we can modify vertices
//glUnmapBuffer(GL_ARRAY_BUFFER);

// Draw a 3d mesh with material and transform

// NOTE: On OpenGL 1.1 we use Vertex Arrays to draw model
// Enable vertex array
// Enable texture coords array
// Enable normals array
// Enable colors array

// Pointer to vertex coords array
// Pointer to texture coords array
// Pointer to normals array
// Pointer to colors array

// Disable vertex array
// Disable texture coords array
// Disable normals array
// Disable colors array

// Bind shader program

// Matrices and other values required by shader
//-----------------------------------------------------
// Calculate and send to shader model matrix (used by PBR shader)

// Upload to shader material.colDiffuse

// Upload to shader material.colSpecular (if available)

// At this point the modelview matrix just contains the view matrix (camera)
// That's because BeginMode3D() sets it an no model-drawing function modifies it, all use rlPushMatrix() and rlPopMatrix()
// View matrix (camera)
// Projection matrix (perspective)

// TODO: Consider possible transform matrices in the RLGL.State.stack
// Is this the right order? or should we start with the first stored matrix instead of the last one?
//Matrix matStackTransform = MatrixIdentity();
//for (int i = RLGL.State.stackCounter; i > 0; i--) matStackTransform = MatrixMultiply(RLGL.State.stack[i], matStackTransform);

// Transform to camera-space coordinates

//-----------------------------------------------------

// Bind active texture maps (if available)

// Bind vertex array objects (or VBOs)

// Bind mesh VBO data: vertex position (shader-location = 0)

// Bind mesh VBO data: vertex texcoords (shader-location = 1)

// Bind mesh VBO data: vertex normals (shader-location = 2, if available)

// Bind mesh VBO data: vertex colors (shader-location = 3, if available)

// Set default value for unused attribute
// NOTE: Required when using default shader and no VAO support

// Bind mesh VBO data: vertex tangents (shader-location = 4, if available)

// Bind mesh VBO data: vertex texcoords2 (shader-location = 5, if available)

// Calculate model-view-projection matrix (MVP)
// Transform to screen-space coordinates

// Send combined model-view-projection matrix to shader

// Draw call!
// Indexed vertices draw

// Unbind all binded texture maps

// Set shader active texture

// Unbind current active texture

// Unind vertex array objects (or VBOs)

// Unbind shader program

// Restore RLGL.State.projection/RLGL.State.modelview matrices
// NOTE: In stereo rendering matrices are being modified to fit every eye

// Unload mesh data from CPU and GPU

// vertex
// texcoords
// normals
// colors
// tangents
// texcoords2
// indices

// Read screen pixel data (color buffer)

// NOTE 1: glReadPixels returns image flipped vertically -> (0,0) is the bottom left corner of the framebuffer
// NOTE 2: We are getting alpha channel! Be careful, it can be transparent if not cleared properly!

// Flip image vertically!

// Flip line

// Set alpha component value to 255 (no trasparent image retrieval)
// NOTE: Alpha value has already been applied to RGB in framebuffer, we don't need it!

// NOTE: image data should be freed

// Read texture pixel data

// NOTE: Using texture.id, we can retrieve some texture info (but not on OpenGL ES 2.0)
// Possible texture info: GL_TEXTURE_RED_SIZE, GL_TEXTURE_GREEN_SIZE, GL_TEXTURE_BLUE_SIZE, GL_TEXTURE_ALPHA_SIZE
//int width, height, format;
//glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &width);
//glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &height);
//glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_INTERNAL_FORMAT, &format);

// NOTE: Each row written to or read from by OpenGL pixel operations like glGetTexImage are aligned to a 4 byte boundary by default, which may add some padding.
// Use glPixelStorei to modify padding with the GL_[UN]PACK_ALIGNMENT setting.
// GL_PACK_ALIGNMENT affects operations that read from OpenGL memory (glReadPixels, glGetTexImage, etc.)
// GL_UNPACK_ALIGNMENT affects operations that write to OpenGL memory (glTexImage, etc.)

// glGetTexImage() is not available on OpenGL ES 2.0
// Texture2D width and height are required on OpenGL ES 2.0. There is no way to get it from texture id.
// Two possible Options:
// 1 - Bind texture to color fbo attachment and glReadPixels()
// 2 - Create an fbo, activate it, render quad with texture, glReadPixels()
// We are using Option 1, just need to care for texture format on retrieval
// NOTE: This behaviour could be conditioned by graphic driver...

// Attach our texture to FBO
// NOTE: Previoust attached texture is automatically detached

// We read data as RGBA because FBO texture is configured as RGBA, despite binding another texture format

// Re-attach internal FBO color texture before deleting it

// Clean up temporal fbo

//----------------------------------------------------------------------------------
// Module Functions Definition - Shaders Functions
// NOTE: Those functions are exposed directly to the user in raylib.h
//----------------------------------------------------------------------------------

// Get default internal texture (white texture)

// Get texture to draw shapes (RAII)

// Get texture rectangle to draw shapes

// Define default texture used to draw shapes

// Get default shader

// Load shader from files and bind default locations
// NOTE: If shader string is NULL, using default vertex/fragment shaders

// NOTE: Shader.locs is allocated by LoadShaderCode()

// Load shader from code strings
// NOTE: If shader string is NULL, using default vertex/fragment shaders

// NOTE: All locations must be reseted to -1 (no location)

// After shader loading, we TRY to set default location names

// Get available shader uniforms
// NOTE: This information is useful for debug...

// Assume no variable names longer than 256

// Get the name of the uniforms

// Unload shader from GPU memory (VRAM)

// Begin custom shader mode

// End custom shader mode (returns to default shader)

// Get shader uniform location

// Set shader uniform value

// Set shader uniform value vector

//glUseProgram(0);      // Avoid reseting current shader program, in case other uniforms are set

// Set shader uniform value (matrix 4x4)

//glUseProgram(0);

// Set shader uniform value for texture

//glUseProgram(0);

// Set a custom projection matrix (replaces internal projection matrix)

// Return internal projection matrix

// Set a custom modelview matrix (replaces internal modelview matrix)

// Return internal modelview matrix

// Generate cubemap texture from HDR texture
// TODO: OpenGL ES 2.0 does not support GL_RGB16F texture format, neither GL_DEPTH_COMPONENT24

// NOTE: SetShaderDefaultLocations() already setups locations for projection and view Matrix in shader
// Other locations should be setup externally in shader before calling the function

// Set up depth face culling and cubemap seamless

// Flag not supported on OpenGL ES 2.0

// Setup framebuffer

// Set up cubemap to render and attach to framebuffer
// NOTE: Faces are stored as 32 bit floating point values

// Flag not supported on OpenGL ES 2.0

// Create projection and different views for each face

// Convert HDR equirectangular environment map to cubemap equivalent

// Note: don't forget to configure the viewport to the capture dimensions

// Unbind framebuffer and textures

// Reset viewport dimensions to default

//glEnable(GL_CULL_FACE);

// NOTE: Texture2D is a GL_TEXTURE_CUBE_MAP, not a GL_TEXTURE_2D!

// Generate irradiance texture using cubemap data
// TODO: OpenGL ES 2.0 does not support GL_RGB16F texture format, neither GL_DEPTH_COMPONENT24

// || defined(GRAPHICS_API_OPENGL_ES2)
// NOTE: SetShaderDefaultLocations() already setups locations for projection and view Matrix in shader
// Other locations should be setup externally in shader before calling the function

// Setup framebuffer

// Create an irradiance cubemap, and re-scale capture FBO to irradiance scale

// Create projection (transposed) and different views for each face

// Solve diffuse integral by convolution to create an irradiance cubemap

// Note: don't forget to configure the viewport to the capture dimensions

// Unbind framebuffer and textures

// Reset viewport dimensions to default

//irradiance.format = UNCOMPRESSED_R16G16B16;

// Generate prefilter texture using cubemap data
// TODO: OpenGL ES 2.0 does not support GL_RGB16F texture format, neither GL_DEPTH_COMPONENT24

// || defined(GRAPHICS_API_OPENGL_ES2)
// NOTE: SetShaderDefaultLocations() already setups locations for projection and view Matrix in shader
// Other locations should be setup externally in shader before calling the function
// TODO: Locations should be taken out of this function... too shader dependant...

// Setup framebuffer

// Create a prefiltered HDR environment map

// Generate mipmaps for the prefiltered HDR texture

// Create projection (transposed) and different views for each face

// Prefilter HDR and store data into mipmap levels

// Max number of prefilter texture mipmaps

// Resize framebuffer according to mip-level size.

// Unbind framebuffer and textures

// Reset viewport dimensions to default

//prefilter.mipmaps = 1 + (int)floor(log(size)/log(2));
//prefilter.format = UNCOMPRESSED_R16G16B16;

// Generate BRDF texture using cubemap data
// NOTE: OpenGL ES 2.0 does not support GL_RGB16F texture format, neither GL_DEPTH_COMPONENT24
// TODO: Review implementation: https://github.com/HectorMF/BRDFGenerator

// Generate BRDF convolution texture

// Render BRDF LUT into a quad using FBO

// Unbind framebuffer and textures

// Unload framebuffer but keep color texture

// Reset viewport dimensions to default

// Begin blending mode (alpha, additive, multiplied)
// NOTE: Only 3 blending modes supported, default blend mode is alpha

// Track current blending mode

// Alternative: glBlendFunc(GL_ONE, GL_ONE);

// End blending mode (reset to default: alpha blending)

// Init VR simulator for selected device parameters
// NOTE: It modifies the global variable: RLGL.Vr.stereoFbo

// Initialize framebuffer and textures for stereo rendering
// NOTE: Screen size should match HMD aspect ratio

// Update VR tracking (position and orientation) and camera
// NOTE: Camera (position, target, up) gets update with head tracking information

// TODO: Simulate 1st person camera system

// Close VR simulator for current device

// Unload stereo framebuffer and texture

// Set stereo rendering configuration parameters

// Reset RLGL.Vr.config for a new values assignment

// Assign distortion shader

// Compute aspect ratio

// Compute lens parameters

// Compute distortion scale parameters
// NOTE: To get lens max radius, lensShift must be normalized to [-1..1]

// Fovy is normally computed with: 2*atan2f(hmd.vScreenSize, 2*hmd.eyeToScreenDistance)
// ...but with lens distortion it is increased (see Oculus SDK Documentation)
//float fovy = 2.0f*atan2f(hmd.vScreenSize*0.5f*distortionScale, hmd.eyeToScreenDistance);     // Really need distortionScale?

// Compute camera projection matrices
// Scaled to projection space coordinates [-1..1]

// Compute camera transformation matrices
// NOTE: Camera movement might seem more natural if we model the head.
// Our axis of rotation is the base of our head, so we might want to add
// some y (base of head to eye level) and -z (center of head to eye protrusion) to the camera positions.

// Compute eyes Viewports

// Update distortion shader with lens and distortion-scale parameters

// Detect if VR simulator is running

// Enable/Disable VR experience (device or simulator)

// Reset viewport and default projection-modelview matrices

// Begin VR drawing configuration

// Setup framebuffer for stereo rendering
//glEnable(GL_FRAMEBUFFER_SRGB);        // Enable SRGB framebuffer (only if required)

//glViewport(0, 0, buffer.width, buffer.height);    // Useful if rendering to separate framebuffers (every eye)
// Clear current framebuffer

// End VR drawing process (and desktop mirror)

// Disable stereo render

// Unbind current framebuffer

// Clear current framebuffer

// Set viewport to default framebuffer size (screen size)

// Let rlgl reconfigure internal matrices
// Enable internal projection matrix
// Reset internal projection matrix
// Recalculate internal RLGL.State.projection matrix
// Enable internal modelview matrix
// Reset internal modelview matrix

// Draw RenderTexture (RLGL.Vr.stereoFbo) using distortion shader if available

// Bottom-left corner for texture and quad

// Bottom-right corner for texture and quad

// Top-right corner for texture and quad

// Top-left corner for texture and quad

// Update and draw render texture fbo with distortion to backbuffer

// Restore RLGL.State.defaultShader

// Reset viewport and default projection-modelview matrices

// SUPPORT_VR_SIMULATOR

//----------------------------------------------------------------------------------
// Module specific Functions Definition
//----------------------------------------------------------------------------------

// Compile custom shader and return shader id

// Load custom shader strings and return program id

// NOTE: Default attribute shader locations must be binded before linking

// NOTE: If some attrib name is no found on the shader, it locations becomes -1

// NOTE: All uniform variables are intitialised to 0 when a program links

// Load default shader (just vertex positioning and texture coloring)
// NOTE: This shader program is used for internal buffers

// NOTE: All locations must be reseted to -1 (no location)

// Vertex shader directly defined, no external file required

// Fragment shader directly defined, no external file required

// precision required for OpenGL ES2 (WebGL)

// NOTE: texture2D() is deprecated on OpenGL 3.3 and ES 3.0

// NOTE: Compiled vertex/fragment shaders are kept for re-use
// Compile default vertex shader
// Compile default fragment shader

// Set default shader locations: attributes locations

// Set default shader locations: uniform locations

// NOTE: We could also use below function but in case DEFAULT_ATTRIB_* points are
// changed for external custom shaders, we just use direct bindings above
//SetShaderDefaultLocations(&shader);

// Get location handlers to for shader attributes and uniforms
// NOTE: If any location is not found, loc point becomes -1

// NOTE: Default shader attrib locations have been fixed before linking:
//          vertex position location    = 0
//          vertex texcoord location    = 1
//          vertex normal location      = 2
//          vertex color location       = 3
//          vertex tangent location     = 4
//          vertex texcoord2 location   = 5

// Get handles to GLSL input attibute locations

// Get handles to GLSL uniform locations (vertex shader)

// Get handles to GLSL uniform locations (fragment shader)

// Unload default shader

// Load default internal buffers

// Initialize CPU (RAM) arrays (vertex position, texcoord, color data and indexes)
//--------------------------------------------------------------------------------------------

// 3 float by vertex, 4 vertex by quad
// 2 float by texcoord, 4 texcoord by quad
// 4 float by color, 4 colors by quad

// 6 int by quad (indices)

// 6 int by quad (indices)

// Indices can be initialized right now

//--------------------------------------------------------------------------------------------

// Upload to GPU (VRAM) vertex data and initialize VAOs/VBOs
//--------------------------------------------------------------------------------------------

// Initialize Quads VAO

// Quads - Vertex buffers binding and attributes enable
// Vertex position buffer (shader-location = 0)

// Vertex texcoord buffer (shader-location = 1)

// Vertex color buffer (shader-location = 3)

// Fill index buffer

// Unbind the current VAO

//--------------------------------------------------------------------------------------------

// Update default internal buffers (VAOs/VBOs) with vertex array data
// NOTE: If there is not vertex data, buffers doesn't need to be updated (vertexCount > 0)
// TODO: If no data changed on the CPU arrays --> No need to re-update GPU arrays (change flag required)

// Update vertex buffers data

// Activate elements VAO

// Vertex positions buffer

//glBufferData(GL_ARRAY_BUFFER, sizeof(float)*3*4*MAX_BATCH_ELEMENTS, RLGL.State.vertexData[RLGL.State.currentBuffer].vertices, GL_DYNAMIC_DRAW);  // Update all buffer

// Texture coordinates buffer

//glBufferData(GL_ARRAY_BUFFER, sizeof(float)*2*4*MAX_BATCH_ELEMENTS, RLGL.State.vertexData[RLGL.State.currentBuffer].texcoords, GL_DYNAMIC_DRAW); // Update all buffer

// Colors buffer

//glBufferData(GL_ARRAY_BUFFER, sizeof(float)*4*4*MAX_BATCH_ELEMENTS, RLGL.State.vertexData[RLGL.State.currentBuffer].colors, GL_DYNAMIC_DRAW);    // Update all buffer

// NOTE: glMapBuffer() causes sync issue.
// If GPU is working with this buffer, glMapBuffer() will wait(stall) until GPU to finish its job.
// To avoid waiting (idle), you can call first glBufferData() with NULL pointer before glMapBuffer().
// If you do that, the previous data in PBO will be discarded and glMapBuffer() returns a new
// allocated pointer immediately even if GPU is still working with the previous data.

// Another option: map the buffer object into client's memory
// Probably this code could be moved somewhere else...
// RLGL.State.vertexData[RLGL.State.currentBuffer].vertices = (float *)glMapBuffer(GL_ARRAY_BUFFER, GL_READ_WRITE);
// if (RLGL.State.vertexData[RLGL.State.currentBuffer].vertices)
// {
// Update vertex data
// }
// glUnmapBuffer(GL_ARRAY_BUFFER);

// Unbind the current VAO

// Draw default internal buffers vertex data

// Draw buffers

// Set current shader and upload current MVP matrix

// Create modelview-projection matrix

// Provided value refers to the texture unit (active)

// TODO: Support additional texture units on custom shader
//if (RLGL.State.currentShader->locs[LOC_MAP_SPECULAR] > 0) glUniform1i(RLGL.State.currentShader.locs[LOC_MAP_SPECULAR], 1);
//if (RLGL.State.currentShader->locs[LOC_MAP_NORMAL] > 0) glUniform1i(RLGL.State.currentShader.locs[LOC_MAP_NORMAL], 2);

// NOTE: Right now additional map textures not considered for default buffers drawing

// Bind vertex attrib: position (shader-location = 0)

// Bind vertex attrib: texcoord (shader-location = 1)

// Bind vertex attrib: color (shader-location = 3)

// TODO: Find some way to bind additional textures --> Use global texture IDs? Register them on draw[i]?
//if (RLGL.State.currentShader->locs[LOC_MAP_SPECULAR] > 0) { glActiveTexture(GL_TEXTURE1); glBindTexture(GL_TEXTURE_2D, textureUnit1_id); }
//if (RLGL.State.currentShader->locs[LOC_MAP_SPECULAR] > 0) { glActiveTexture(GL_TEXTURE2); glBindTexture(GL_TEXTURE_2D, textureUnit2_id); }

// We need to define the number of indices to be processed: quadsCount*6
// NOTE: The final parameter tells the GPU the offset in bytes from the
// start of the index buffer to the location of the first index to process

// Unbind textures

// Unbind VAO

// Unbind shader program

// Reset vertex counters for next frame

// Reset depth for next draw

// Restore projection/modelview matrices

// Reset RLGL.State.draws array

// Change to next buffer in the list

// Unload default internal buffers vertex data from CPU and GPU

// Unbind everything

// Delete VBOs from GPU (VRAM)

// Delete VAOs from GPU (VRAM)

// Free vertex arrays memory from CPU (RAM)

// Renders a 1x1 XY quad in NDC

// Positions        // Texture Coords

// Set up plane VAO

// Fill buffer

// Link vertex attributes

// Draw quad

// Renders a 1x1 3D cube in NDC

// Set up cube VAO

// Fill buffer

// Link vertex attributes

// Draw cube

// Set internal projection and modelview matrix depending on eyes tracking data

// Setup viewport and projection/modelview matrices using tracking data

// Apply view offset to modelview matrix

// Set current eye projection matrix

// SUPPORT_VR_SIMULATOR

// GRAPHICS_API_OPENGL_33 || GRAPHICS_API_OPENGL_ES2

// Mipmaps data is generated after image data
// NOTE: Only works with RGBA (4 bytes) data!

// Required mipmap levels count (including base level)

// Size in bytes (will include mipmaps...), RGBA only

// Count mipmap levels required

// Add mipmap size (in bytes)

// Generate mipmaps
// NOTE: Every mipmap data is stored after data

// Size of last mipmap

// Mipmap size to store after offset

// Add mipmap to data

// free mipmap data

// Manual mipmap generation (basic scaling algorithm)

// Scaling algorithm works perfectly (box-filter)

// Load text data from file, returns a '\0' terminated string
// NOTE: text chars array should be freed manually

// WARNING: When reading a file as 'text' file,
// text mode causes carriage return-linefeed translation...
// ...but using fseek() should return correct byte-offset

// WARNING: \r\n is converted to \n on reading, so,
// read bytes count gets reduced by the number of lines

// Zero-terminate the string

// Get pixel data size in bytes (image or texture)
// NOTE: Size depends on pixel format

// Size in bytes
// Bits per pixel

// Total data size in bytes

// Most compressed formats works on 4x4 blocks,
// if texture is smaller, minimum dataSize is 8 or 16

// RLGL_STANDALONE

// RLGL_IMPLEMENTATION
/**********************************************************************************************
*
*   raylib.utils - Some common utility functions
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2014-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

extern (C):

// Required for: FILE
// Required for: AAssetManager

//----------------------------------------------------------------------------------
// Some basic Defines
//----------------------------------------------------------------------------------

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------

// Prevents name mangling of functions

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------
// Nop...

//----------------------------------------------------------------------------------
// Module Functions Declaration
//----------------------------------------------------------------------------------

// Initialize asset manager from android app
// Replacement for fopen() -> Read-only!

// UWP Messages System

// Send

// paramVector0 (pos)

// Receive (Into C)
// paramInt0 (key), paramChar0 (status)
// paramInt0 (button), paramChar0 (status)
// paramInt0 (delta)
// paramVector0 (pos)
// paramInt0 (gamepad), paramBool0 (active or not)
// paramInt0 (gamepad), paramInt1 (button), paramChar0 (status)
// paramInt0 (gamepad), int1 (axis), paramFloat0 (value)
// paramVector0 (display dimensions)
// paramVector0 (new dimensions) - Onresized event
// paramInt0

// Message type

// Vector parameters
// Int parameter
// Int parameter
// Char parameters
// Float parameters
// Double parameters
// Bool parameters

// More parameters can be added and fed to functions

// Allocate UWP Message

// Free UWP Message

// Get messages into C++

// For C to call
// Hide from C++ code

//defined(PLATFORM_UWP)

// UTILS_H
/*******************************************************************************************
*
*   raygui v2.8 - A simple and easy-to-use immediate-mode gui library
*
*   DESCRIPTION:
*
*   raygui is a tools-dev-focused immediate-mode-gui library based on raylib but also
*   available as a standalone library, as long as input and drawing functions are provided.
*
*   Controls provided:
*
*   # Container/separators Controls
*       - WindowBox
*       - GroupBox
*       - Line
*       - Panel
*
*   # Basic Controls
*       - Label
*       - Button
*       - LabelButton   --> Label
*       - ImageButton   --> Button
*       - ImageButtonEx --> Button
*       - Toggle
*       - ToggleGroup   --> Toggle
*       - CheckBox
*       - ComboBox
*       - DropdownBox
*       - TextBox
*       - TextBoxMulti
*       - ValueBox      --> TextBox
*       - Spinner       --> Button, ValueBox
*       - Slider
*       - SliderBar     --> Slider
*       - ProgressBar
*       - StatusBar
*       - ScrollBar
*       - ScrollPanel
*       - DummyRec
*       - Grid
*
*   # Advance Controls
*       - ListView
*       - ColorPicker   --> ColorPanel, ColorBarHue
*       - MessageBox    --> Window, Label, Button
*       - TextInputBox  --> Window, Label, TextBox, Button
*
*   It also provides a set of functions for styling the controls based on its properties (size, color).
*
*   CONFIGURATION:
*
*   #define RAYGUI_IMPLEMENTATION
*       Generates the implementation of the library into the included file.
*       If not defined, the library is in header only mode and can be included in other headers
*       or source files without problems. But only ONE file should hold the implementation.
*
*   #define RAYGUI_STATIC (defined by default)
*       The generated implementation will stay private inside implementation file and all
*       internal symbols and functions will only be visible inside that file.
*
*   #define RAYGUI_STANDALONE
*       Avoid raylib.h header inclusion in this file. Data types defined on raylib are defined
*       internally in the library and input management and drawing functions must be provided by
*       the user (check library implementation for further details).
*
*   #define RAYGUI_SUPPORT_ICONS
*       Includes riconsdata.h header defining a set of 128 icons (binary format) to be used on
*       multiple controls and following raygui styles
*
*
*   VERSIONS HISTORY:
*       2.8 (03-May-2020) Centralized rectangles drawing to GuiDrawRectangle()
*       2.7 (20-Feb-2020) Added possible tooltips API
*       2.6 (09-Sep-2019) ADDED: GuiTextInputBox()
*                         REDESIGNED: GuiListView*(), GuiDropdownBox(), GuiSlider*(), GuiProgressBar(), GuiMessageBox()
*                         REVIEWED: GuiTextBox(), GuiSpinner(), GuiValueBox(), GuiLoadStyle()
*                         Replaced property INNER_PADDING by TEXT_PADDING, renamed some properties
*                         Added 8 new custom styles ready to use
*                         Multiple minor tweaks and bugs corrected
*       2.5 (28-May-2019) Implemented extended GuiTextBox(), GuiValueBox(), GuiSpinner()
*       2.3 (29-Apr-2019) Added rIcons auxiliar library and support for it, multiple controls reviewed
*                         Refactor all controls drawing mechanism to use control state
*       2.2 (05-Feb-2019) Added GuiScrollBar(), GuiScrollPanel(), reviewed GuiListView(), removed Gui*Ex() controls
*       2.1 (26-Dec-2018) Redesign of GuiCheckBox(), GuiComboBox(), GuiDropdownBox(), GuiToggleGroup() > Use combined text string
*                         Complete redesign of style system (breaking change)
*       2.0 (08-Nov-2018) Support controls guiLock and custom fonts, reviewed GuiComboBox(), GuiListView()...
*       1.9 (09-Oct-2018) Controls review: GuiGrid(), GuiTextBox(), GuiTextBoxMulti(), GuiValueBox()...
*       1.8 (01-May-2018) Lot of rework and redesign to align with rGuiStyler and rGuiLayout
*       1.5 (21-Jun-2017) Working in an improved styles system
*       1.4 (15-Jun-2017) Rewritten all GUI functions (removed useless ones)
*       1.3 (12-Jun-2017) Redesigned styles system
*       1.1 (01-Jun-2017) Complete review of the library
*       1.0 (07-Jun-2016) Converted to header-only by Ramon Santamaria.
*       0.9 (07-Mar-2016) Reviewed and tested by Albert Martos, Ian Eito, Sergio Martinez and Ramon Santamaria.
*       0.8 (27-Aug-2015) Initial release. Implemented by Kevin Gato, Daniel Nicolás and Ramon Santamaria.
*
*   CONTRIBUTORS:
*       Ramon Santamaria:   Supervision, review, redesign, update and maintenance...
*       Vlad Adrian:        Complete rewrite of GuiTextBox() to support extended features (2019)
*       Sergio Martinez:    Review, testing (2015) and redesign of multiple controls (2018)
*       Adria Arranz:       Testing and Implementation of additional controls (2018)
*       Jordi Jorba:        Testing and Implementation of additional controls (2018)
*       Albert Martos:      Review and testing of the library (2015)
*       Ian Eito:           Review and testing of the library (2015)
*       Kevin Gato:         Initial implementation of basic components (2014)
*       Daniel Nicolas:     Initial implementation of basic components (2014)
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2014-2020 Ramon Santamaria (@raysan5)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/

extern (C):

enum RAYGUI_VERSION = "2.6-dev";

// Define functions scope to be used internally (static) or externally (extern) to the module including this file

// Functions just visible to module including this file

// Functions visible from other files (no name mangling of functions in C++)

// NOTE: By default any function declared in a C file is extern // Functions visible from other files

// We are building raygui as a Win32 shared library (.dll).

// We are using raygui as a Win32 shared library (.dll)

// Required for: malloc(), calloc(), free()

// Allow custom memory allocators

alias RAYGUI_MALLOC = malloc;

alias RAYGUI_CALLOC = calloc;

alias RAYGUI_FREE = free;

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
enum NUM_CONTROLS = 16; // Number of standard controls
enum NUM_PROPS_DEFAULT = 16; // Number of standard properties
enum NUM_PROPS_EXTENDED = 8; // Number of extended properties

enum TEXTEDIT_CURSOR_BLINK_FRAMES = 20; // Text edit controls cursor blink timming

//----------------------------------------------------------------------------------
// Types and Structures Definition
// NOTE: Some types are required for RAYGUI_STANDALONE usage
//----------------------------------------------------------------------------------

// Boolean type

// Vector2 type

// Vector3 type

// Color type, RGBA (32bit)

// Rectangle type

// TODO: Texture2D type is very coupled to raylib, mostly required by GuiImageButton()
// It should be redesigned to be provided by user

// OpenGL texture id
// Texture base width
// Texture base height
// Mipmap levels, 1 by default
// Data format (PixelFormat type)

// Font character info

// TODO: Font type is very coupled to raylib, mostly required by GuiLoadStyle()
// It should be redesigned to be provided by user

// Base size (default chars height)
// Number of characters
// Characters texture atlas
// Characters rectangles in texture
// Characters info data

// Style property
struct GuiStyleProp
{
    ushort controlId;
    ushort propertyId;
    int propertyValue;
}

// Gui control state
enum GuiControlState
{
    GUI_STATE_NORMAL = 0,
    GUI_STATE_FOCUSED = 1,
    GUI_STATE_PRESSED = 2,
    GUI_STATE_DISABLED = 3
}

// Gui control text alignment
enum GuiTextAlignment
{
    GUI_TEXT_ALIGN_LEFT = 0,
    GUI_TEXT_ALIGN_CENTER = 1,
    GUI_TEXT_ALIGN_RIGHT = 2
}

// Gui controls
enum GuiControl
{
    DEFAULT = 0,
    LABEL = 1, // LABELBUTTON
    BUTTON = 2, // IMAGEBUTTON
    TOGGLE = 3, // TOGGLEGROUP
    SLIDER = 4, // SLIDERBAR
    PROGRESSBAR = 5,
    CHECKBOX = 6,
    COMBOBOX = 7,
    DROPDOWNBOX = 8,
    TEXTBOX = 9, // TEXTBOXMULTI
    VALUEBOX = 10,
    SPINNER = 11,
    LISTVIEW = 12,
    COLORPICKER = 13,
    SCROLLBAR = 14,
    STATUSBAR = 15
}

// Gui base properties for every control
enum GuiControlProperty
{
    BORDER_COLOR_NORMAL = 0,
    BASE_COLOR_NORMAL = 1,
    TEXT_COLOR_NORMAL = 2,
    BORDER_COLOR_FOCUSED = 3,
    BASE_COLOR_FOCUSED = 4,
    TEXT_COLOR_FOCUSED = 5,
    BORDER_COLOR_PRESSED = 6,
    BASE_COLOR_PRESSED = 7,
    TEXT_COLOR_PRESSED = 8,
    BORDER_COLOR_DISABLED = 9,
    BASE_COLOR_DISABLED = 10,
    TEXT_COLOR_DISABLED = 11,
    BORDER_WIDTH = 12,
    TEXT_PADDING = 13,
    TEXT_ALIGNMENT = 14,
    RESERVED = 15
}

// Gui extended properties depend on control
// NOTE: We reserve a fixed size of additional properties per control

// DEFAULT properties
enum GuiDefaultProperty
{
    TEXT_SIZE = 16,
    TEXT_SPACING = 17,
    LINE_COLOR = 18,
    BACKGROUND_COLOR = 19
}

// Label
//typedef enum { } GuiLabelProperty;

// Button
//typedef enum { } GuiButtonProperty;

// Toggle / ToggleGroup
enum GuiToggleProperty
{
    GROUP_PADDING = 16
}

// Slider / SliderBar
enum GuiSliderProperty
{
    SLIDER_WIDTH = 16,
    SLIDER_PADDING = 17
}

// ProgressBar
enum GuiProgressBarProperty
{
    PROGRESS_PADDING = 16
}

// CheckBox
enum GuiCheckBoxProperty
{
    CHECK_PADDING = 16
}

// ComboBox
enum GuiComboBoxProperty
{
    COMBO_BUTTON_WIDTH = 16,
    COMBO_BUTTON_PADDING = 17
}

// DropdownBox
enum GuiDropdownBoxProperty
{
    ARROW_PADDING = 16,
    DROPDOWN_ITEMS_PADDING = 17
}

// TextBox / TextBoxMulti / ValueBox / Spinner
enum GuiTextBoxProperty
{
    TEXT_INNER_PADDING = 16,
    TEXT_LINES_PADDING = 17,
    COLOR_SELECTED_FG = 18,
    COLOR_SELECTED_BG = 19
}

// Spinner
enum GuiSpinnerProperty
{
    SPIN_BUTTON_WIDTH = 16,
    SPIN_BUTTON_PADDING = 17
}

// ScrollBar
enum GuiScrollBarProperty
{
    ARROWS_SIZE = 16,
    ARROWS_VISIBLE = 17,
    SCROLL_SLIDER_PADDING = 18,
    SCROLL_SLIDER_SIZE = 19,
    SCROLL_PADDING = 20,
    SCROLL_SPEED = 21
}

// ScrollBar side
enum GuiScrollBarSide
{
    SCROLLBAR_LEFT_SIDE = 0,
    SCROLLBAR_RIGHT_SIDE = 1
}

// ListView
enum GuiListViewProperty
{
    LIST_ITEMS_HEIGHT = 16,
    LIST_ITEMS_PADDING = 17,
    SCROLLBAR_WIDTH = 18,
    SCROLLBAR_SIDE = 19
}

// ColorPicker
enum GuiColorPickerProperty
{
    COLOR_SELECTOR_SIZE = 16,
    HUEBAR_WIDTH = 17, // Right hue bar width
    HUEBAR_PADDING = 18, // Right hue bar separation from panel
    HUEBAR_SELECTOR_HEIGHT = 19, // Right hue bar selector height
    HUEBAR_SELECTOR_OVERFLOW = 20 // Right hue bar selector overflow
}

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------
// ...

//----------------------------------------------------------------------------------
// Module Functions Declaration
//----------------------------------------------------------------------------------

// State modification functions
void GuiEnable (); // Enable gui controls (global state)
void GuiDisable (); // Disable gui controls (global state)
void GuiLock (); // Lock gui controls (global state)
void GuiUnlock (); // Unlock gui controls (global state)
void GuiFade (float alpha); // Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
void GuiSetState (int state); // Set gui state (global state)
int GuiGetState (); // Get gui state (global state)

// Font set/get functions
void GuiSetFont (Font font); // Set gui custom font (global state)
Font GuiGetFont (); // Get gui custom font (global state)

// Style set/get functions
void GuiSetStyle (int control, int property, int value); // Set one style property
int GuiGetStyle (int control, int property); // Get one style property

// Tooltips set functions
void GuiEnableTooltip (); // Enable gui tooltips
void GuiDisableTooltip (); // Disable gui tooltips
void GuiSetTooltip (const(char)* tooltip); // Set current tooltip for display
void GuiClearTooltip (); // Clear any tooltip registered

// Container/separator controls, useful for controls organization
bool GuiWindowBox (Rectangle bounds, const(char)* title); // Window Box control, shows a window that can be closed
void GuiGroupBox (Rectangle bounds, const(char)* text); // Group Box control with text name
void GuiLine (Rectangle bounds, const(char)* text); // Line separator control, could contain text
void GuiPanel (Rectangle bounds); // Panel control, useful to group controls
Rectangle GuiScrollPanel (Rectangle bounds, Rectangle content, Vector2* scroll); // Scroll Panel control

// Basic controls set
void GuiLabel (Rectangle bounds, const(char)* text); // Label control, shows text
bool GuiButton (Rectangle bounds, const(char)* text); // Button control, returns true when clicked
bool GuiLabelButton (Rectangle bounds, const(char)* text); // Label button control, show true when clicked
bool GuiImageButton (Rectangle bounds, const(char)* text, Texture2D texture); // Image button control, returns true when clicked
bool GuiImageButtonEx (Rectangle bounds, const(char)* text, Texture2D texture, Rectangle texSource); // Image button extended control, returns true when clicked
bool GuiToggle (Rectangle bounds, const(char)* text, bool active); // Toggle Button control, returns true when active
int GuiToggleGroup (Rectangle bounds, const(char)* text, int active); // Toggle Group control, returns active toggle index
bool GuiCheckBox (Rectangle bounds, const(char)* text, bool checked); // Check Box control, returns true when active
int GuiComboBox (Rectangle bounds, const(char)* text, int active); // Combo Box control, returns selected item index
bool GuiDropdownBox (Rectangle bounds, const(char)* text, int* active, bool editMode); // Dropdown Box control, returns selected item
bool GuiSpinner (Rectangle bounds, const(char)* text, int* value, int minValue, int maxValue, bool editMode); // Spinner control, returns selected value
bool GuiValueBox (Rectangle bounds, const(char)* text, int* value, int minValue, int maxValue, bool editMode); // Value Box control, updates input text with numbers
bool GuiTextBox (Rectangle bounds, char* text, int textSize, bool editMode); // Text Box control, updates input text
bool GuiTextBoxMulti (Rectangle bounds, char* text, int textSize, bool editMode); // Text Box control with multiple lines
float GuiSlider (Rectangle bounds, const(char)* textLeft, const(char)* textRight, float value, float minValue, float maxValue); // Slider control, returns selected value
float GuiSliderBar (Rectangle bounds, const(char)* textLeft, const(char)* textRight, float value, float minValue, float maxValue); // Slider Bar control, returns selected value
float GuiProgressBar (Rectangle bounds, const(char)* textLeft, const(char)* textRight, float value, float minValue, float maxValue); // Progress Bar control, shows current progress value
void GuiStatusBar (Rectangle bounds, const(char)* text); // Status Bar control, shows info text
void GuiDummyRec (Rectangle bounds, const(char)* text); // Dummy control for placeholders
int GuiScrollBar (Rectangle bounds, int value, int minValue, int maxValue); // Scroll Bar control
Vector2 GuiGrid (Rectangle bounds, float spacing, int subdivs); // Grid control

// Advance controls set
int GuiListView (Rectangle bounds, const(char)* text, int* scrollIndex, int active); // List View control, returns selected list item index
int GuiListViewEx (Rectangle bounds, const(char*)* text, int count, int* focus, int* scrollIndex, int active); // List View with extended parameters
int GuiMessageBox (Rectangle bounds, const(char)* title, const(char)* message, const(char)* buttons); // Message Box control, displays a message
int GuiTextInputBox (Rectangle bounds, const(char)* title, const(char)* message, const(char)* buttons, char* text); // Text Input Box control, ask for text
Color GuiColorPicker (Rectangle bounds, Color color); // Color Picker control (multiple color controls)
Color GuiColorPanel (Rectangle bounds, Color color); // Color Panel control
float GuiColorBarAlpha (Rectangle bounds, float alpha); // Color Bar Alpha control
float GuiColorBarHue (Rectangle bounds, float value); // Color Bar Hue control

// Styles loading functions
void GuiLoadStyle (const(char)* fileName); // Load style file (.rgs)
void GuiLoadStyleDefault (); // Load style default over global style

/*
typedef GuiStyle (unsigned int *)
RAYGUIDEF GuiStyle LoadGuiStyle(const char *fileName);          // Load style from file (.rgs)
RAYGUIDEF void UnloadGuiStyle(GuiStyle style);                  // Unload style
*/

const(char)* GuiIconText (int iconId, const(char)* text); // Get text with icon id prepended (if supported)

// Gui icons functionality

// Get full icons data pointer
// Get icon bit data
// Set icon bit data

// Set icon pixel value
// Clear icon pixel value
// Check icon pixel value

// RAYGUI_H

/***********************************************************************************
*
*   RAYGUI IMPLEMENTATION
*
************************************************************************************/

// Required for: raygui icons data

// Required for: FILE, fopen(), fclose(), fprintf(), feof(), fscanf(), vsprintf()
// Required for: strlen() on GuiTextBox()
// Required for: roundf() on GuiColorPicker()

// Required for: va_list, va_start(), vfprintf(), va_end()

//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
//...

//----------------------------------------------------------------------------------
// Types and Structures Definition
//----------------------------------------------------------------------------------
// Gui control property style color element

//----------------------------------------------------------------------------------
// Global Variables Definition
//----------------------------------------------------------------------------------

// Gui current font (WARNING: highly coupled to raylib)
// Gui lock state (no inputs processed)
// Gui element transpacency on drawing

// Global gui style array (allocated on data segment by default)
// NOTE: In raygui we manage a single int array with all the possible style properties.
// When a new style is loaded, it loads over the global style... but default gui style
// could always be recovered with GuiLoadStyleDefault()

// Style loaded flag for lazy style initialization

// Tooltips required variables
// Gui tooltip currently active (user provided)
// Gui tooltips enabled

//----------------------------------------------------------------------------------
// Standalone Mode Functions Declaration
//
// NOTE: raygui depend on some raylib input and drawing functions
// To use raygui as standalone library, below functions must be defined by the user
//----------------------------------------------------------------------------------

// Input required functions
//-------------------------------------------------------------------------------

// -- GuiTextBox(), GuiTextBoxMulti(), GuiValueBox()
//-------------------------------------------------------------------------------

// Drawing required functions
//-------------------------------------------------------------------------------
// -- GuiDrawRectangle(), GuiDrawIcon()

// -- GuiColorPicker()
// -- GuiDropdownBox(), GuiScrollBar()
// -- GuiImageButtonEx()

// -- GuiTextBoxMulti()
//-------------------------------------------------------------------------------

// Text required functions
//-------------------------------------------------------------------------------
// -- GuiLoadStyleDefault()
// -- GetTextWidth(), GuiTextBoxMulti()
// -- GuiDrawText()

// -- GuiLoadStyle()
// -- GuiLoadStyle()
// -- GuiLoadStyle()
//-------------------------------------------------------------------------------

// raylib functions already implemented in raygui
//-------------------------------------------------------------------------------
// Returns a Color struct from hexadecimal value
// Returns hexadecimal value for a Color
// Color fade-in or fade-out, alpha goes from 0.0f to 1.0f
// Check if point is inside rectangle
// Formatting of text with variables to 'embed'
// Split text into multiple strings
// Get integer value from text

// Draw rectangle vertical gradient
//-------------------------------------------------------------------------------

// RAYGUI_STANDALONE

//----------------------------------------------------------------------------------
// Module specific Functions Declaration
//----------------------------------------------------------------------------------
// Gui get text width using default font
// Get text bounds considering control bounds
// Get text icon if provided and move text cursor

// Gui draw text using default font
// Gui draw rectangle using default raygui style
// Draw tooltip relatively to bounds

// Split controls text into multiple strings
// Convert color data from HSV to RGB
// Convert color data from RGB to HSV

//----------------------------------------------------------------------------------
// Gui Setup Functions Definition
//----------------------------------------------------------------------------------
// Enable gui global state

// Disable gui global state

// Lock gui global state

// Unlock gui global state

// Set gui controls alpha global state

// Set gui state (global state)

// Get gui state (global state)

// Set custom gui font
// NOTE: Font loading/unloading is external to raygui

// NOTE: If we try to setup a font but default style has not been
// lazily loaded before, it will be overwritten, so we need to force
// default style loading first

// Get custom gui font

// Set control style property value

// Default properties are propagated to all controls

// Get control style property value

// Enable gui tooltips

// Disable gui tooltips

// Set current tooltip for display

// Clear any tooltip registered

//----------------------------------------------------------------------------------
// Gui Controls Functions Definition
//----------------------------------------------------------------------------------

// Window Box control

// NOTE: This define is also used by GuiMessageBox() and GuiTextInputBox()

//GuiControlState state = guiState;

// Update control
//--------------------------------------------------------------------
// NOTE: Logic is directly managed by button
//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------
// Draw window header as status bar
// Draw window base

// Draw window close button

//--------------------------------------------------------------------

// Group Box control with text name

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Line control

// Draw control
//--------------------------------------------------------------------

// TODO: Consider text icon

// Draw line with embedded text label: "--- text --------------"

//--------------------------------------------------------------------

// Panel control

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Scroll Panel control

// Recheck to account for the other scrollbar being visible

// Calculate view area (area without the scrollbars)

// Clip view area to the actual content size

// TODO: Review!

// Update control
//--------------------------------------------------------------------

// Check button state

// Normalize scroll values

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------
// Draw background

// Save size of the scrollbar slider

// Draw horizontal scrollbar if visible

// Change scrollbar slider size to show the diff in size between the content width and the widget width

// Draw vertical scrollbar if visible

// Change scrollbar slider size to show the diff in size between the content height and the widget height

// Draw detail corner rectangle if both scroll bars are visible

// TODO: Consider scroll bars side

// Draw scrollbar lines depending on current state

// Set scrollbar slider size back to the way it was before

//--------------------------------------------------------------------

// Label control

// Update control
//--------------------------------------------------------------------
// ...
//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Button control, returns true when clicked

// Update control
//--------------------------------------------------------------------

// Check button state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//------------------------------------------------------------------

// Label button control

// NOTE: We force bounds.width to be all text

// Update control
//--------------------------------------------------------------------

// Check checkbox state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Image button control, returns true when clicked

// Image button control, returns true when clicked

// Update control
//--------------------------------------------------------------------

// Check button state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//------------------------------------------------------------------

// Toggle Button control, returns true when active

// Update control
//--------------------------------------------------------------------

// Check toggle button state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Toggle Group control, returns toggled button index

// Get substrings items from text (items pointers)

// Check Box control, returns true when active

// Update control
//--------------------------------------------------------------------

// Check checkbox state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Combo Box control, returns selected item index

// Get substrings items from text (items pointers, lengths and count)

// Update control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------
// Draw combo box main

// Draw selector using a custom button
// NOTE: BORDER_WIDTH and TEXT_ALIGNMENT forced values

//--------------------------------------------------------------------

// Dropdown Box control
// NOTE: Returns mouse click

// Get substrings items from text (items pointers, lengths and count)

// Check mouse button pressed

// Update control
//--------------------------------------------------------------------

// Check if mouse has been pressed or released outside limits

// Check if already selected item has been pressed again

// Check focused and selected item

// Update item rectangle y position for next item

// Item selected, change to editMode = false

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw visible items

// Update item rectangle y position for next item

// TODO: Avoid this function, use icon instead or 'v'

//GuiDrawText("v", RAYGUI_CLITERAL(Rectangle){ bounds.x + bounds.width - GuiGetStyle(DROPDOWNBOX, ARROW_PADDING), bounds.y + bounds.height/2 - 2, 10, 10 },
//            GUI_TEXT_ALIGN_CENTER, Fade(GetColor(GuiGetStyle(DROPDOWNBOX, TEXT + (state*3))), guiAlpha));
//--------------------------------------------------------------------

// Text Box control, updates input text
// NOTE 1: Requires static variables: framesCounter
// NOTE 2: Returns if KEY_ENTER pressed (useful for data validation)

// Required for blinking cursor

// Update control
//--------------------------------------------------------------------

// Returns codepoint as Unicode

// Only allow keys in range [32..125]

// Delete text

// Check text alignment to position cursor properly

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw blinking cursor

//--------------------------------------------------------------------

// Spinner control, returns selected value

// Update control
//--------------------------------------------------------------------

// Check spinner state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------
// TODO: Set Spinner properties for ValueBox

// Draw value selector custom buttons
// NOTE: BORDER_WIDTH and TEXT_ALIGNMENT forced values

// Draw text label if provided

//--------------------------------------------------------------------

// Value Box control, updates input text with numbers
// NOTE: Requires static variables: framesCounter

// Required for blinking cursor

// Update control
//--------------------------------------------------------------------

// Only allow keys in range [48..57]

// Delete text

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// WARNING: BLANK color does not work properly with Fade()

// Draw blinking cursor

// NOTE: ValueBox internal text is always centered

// Draw text label if provided

//--------------------------------------------------------------------

// Text Box control with multiple lines

// Required for blinking cursor

// Cursor position, [x, y] values should be updated

// Update control
//--------------------------------------------------------------------

// Introduce characters

// TODO: Support Unicode inputs

// Delete characters

// Calculate cursor position considering text

// Exit edit mode

// Reset blinking cursor

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw blinking cursor

//--------------------------------------------------------------------

// Slider control with pro parameters
// NOTE: Other GuiSlider*() controls use this one

// Slider

// SliderBar

// Update control
//--------------------------------------------------------------------

// Get equivalent value and slider position from mousePoint.x

// Slider
// SliderBar

// Bar limits check
// Slider

// SliderBar

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw slider internal bar (depends on state)

// Draw left/right text if provided

// TODO: Consider text icon

// TODO: Consider text icon

//--------------------------------------------------------------------

// Slider control extended, returns selected value and has text

// Slider Bar control extended, returns selected value

// Progress Bar control extended, shows current progress value

// Update control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw slider internal progress bar (depends on state)

// Draw left/right text if provided

// TODO: Consider text icon

// TODO: Consider text icon

//--------------------------------------------------------------------

// Status Bar control

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Dummy rectangle control, intended for placeholding

// Update control
//--------------------------------------------------------------------

// Check button state

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

//------------------------------------------------------------------

// Scroll Bar control
// TODO: I feel GuiScrollBar could be simplified...

// Is the scrollbar horizontal or vertical?

// The size (width or height depending on scrollbar type) of the spinner buttons

// Arrow buttons [<] [>] [∧] [∨]

// Actual area of the scrollbar excluding the arrow buttons

// Slider bar that moves     --[///]-----

// Normalize value

// Calculate rectangles for all of the components

// Make sure the slider won't get outside of the scrollbar

// Make sure the slider won't get outside of the scrollbar

// Update control
//--------------------------------------------------------------------

// Handle mouse wheel

// Normalize value

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------
// Draw the background

// Draw the scrollbar active area background
// Draw the slider bar

// Draw arrows

// Coordinates for <     0,1,2

// Coordinates for >     3,4,5

// Coordinates for ∧     6,7,8

// Coordinates for ∨     9,10,11

//--------------------------------------------------------------------

// List View control

// List View control with extended parameters

// Check if we need a scroll bar

// Define base item rectangle [0]

// Get items on the list

// Update control
//--------------------------------------------------------------------

// Check mouse inside list view

// Check focused and selected item

// Update item rectangle y position for next item

// Reset item rectangle y to [0]

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------
// Draw background

// Draw visible items

// Draw item selected

// Draw item focused

// Draw item normal

// Update item rectangle y position for next item

// Calculate percentage of visible items and apply same percentage to scrollbar

// Save default slider size
// Save default scroll speed
// Change slider size
// Change scroll speed

// Reset scroll speed to default
// Reset slider size to default

//--------------------------------------------------------------------

// Color Panel control

// HSV: Saturation
// HSV: Value

// Update control
//--------------------------------------------------------------------

// Calculate color from picker

// Get normalized value on x
// Get normalized value on y

// NOTE: Vector3ToColor() only available on raylib 1.8.1

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw color picker: selector

//--------------------------------------------------------------------

// Color Bar Alpha control
// NOTE: Returns alpha value normalized [0..1]

// Update control
//--------------------------------------------------------------------

//selector.x = bounds.x + (int)(((alpha - 0)/(100 - 0))*(bounds.width - 2*GuiGetStyle(SLIDER, BORDER_WIDTH))) - selector.width/2;

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw alpha bar: checked background

// Draw alpha bar: selector

//--------------------------------------------------------------------

// Color Bar Hue control
// NOTE: Returns hue value normalized [0..1]

// Update control
//--------------------------------------------------------------------

/*if (IsKeyDown(KEY_UP))
{
    hue -= 2.0f;
    if (hue <= 0.0f) hue = 0.0f;
}
else if (IsKeyDown(KEY_DOWN))
{
    hue += 2.0f;
    if (hue >= 360.0f) hue = 360.0f;
}*/

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw hue bar:color bars

// Draw hue bar: selector

//--------------------------------------------------------------------

// TODO: Color GuiColorBarSat() [WHITE->color]
// TODO: Color GuiColorBarValue() [BLACK->color], HSV / HSL
// TODO: float GuiColorBarLuminance() [BLACK->WHITE]

// Color Picker control
// NOTE: It's divided in multiple controls:
//      Color GuiColorPanel(Rectangle bounds, Color color)
//      float GuiColorBarAlpha(Rectangle bounds, float alpha)
//      float GuiColorBarHue(Rectangle bounds, float value)
// NOTE: bounds define GuiColorPanel() size

//Rectangle boundsAlpha = { bounds.x, bounds.y + bounds.height + GuiGetStyle(COLORPICKER, BARS_PADDING), bounds.width, GuiGetStyle(COLORPICKER, BARS_THICK) };

//color.a = (unsigned char)(GuiColorBarAlpha(boundsAlpha, (float)color.a/255.0f)*255.0f);

// Message Box control

// Returns clicked button from buttons list, 0 refers to closed window button

// Draw control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Text Input Box control, ask for text

// Used to enable text edit mode
// WARNING: No more than one GuiTextInputBox() should be open at the same time

// Draw control
//--------------------------------------------------------------------

// Draw message if available

//--------------------------------------------------------------------

// Grid control
// NOTE: Returns grid mouse-hover selected cell
// About drawing lines at subpixel spacing, simple put, not easy solution:
// https://stackoverflow.com/questions/4435450/2d-opengl-drawing-lines-that-dont-exactly-fit-pixel-raster

// Grid lines alpha amount

// Update control
//--------------------------------------------------------------------

//--------------------------------------------------------------------

// Draw control
//--------------------------------------------------------------------

// Draw vertical grid lines

// Draw horizontal grid lines

//----------------------------------------------------------------------------------
// Styles loading functions
//----------------------------------------------------------------------------------

// Load raygui style file (.rgs)

// Try reading the files as text file first

// Style property: p <control_id> <property_id> <property_value> <property_name>

// Style font: f <gen_font_size> <charmap_file> <font_file>

// Load characters from charmap file,
// expected '\n' separated list of integer values

// DEFAULT control

// If a DEFAULT property is loaded, it is propagated to all controls
// NOTE: All DEFAULT properties should be defined first in the file

// Font loading is highly dependant on raylib API to load font data and image
// TODO: Find some mechanism to support it in standalone mode

// Load custom font if available

// 0-Normal, 1-SDF

// Load font white rectangle

// Load font image parameters

// Load font recs data

// Load font chars info data

// Set font texture source rectangle to be used as white texture to draw shapes
// NOTE: This way, all gui can be draw using a single draw call

// Load style default over global style

// We set this variable first to avoid cyclic function calls
// when calling GuiSetStyle() and GuiGetStyle()

// Initialize default LIGHT style property values

// WARNING: Some controls use other values
// WARNING: Some controls use other values
// WARNING: Some controls use other values

// Initialize control-specific property values
// NOTE: Those properties are in default list but require specific values by control type

// Initialize extended property values
// NOTE: By default, extended property values are initialized to 0
// DEFAULT, shared by all controls
// DEFAULT, shared by all controls
// DEFAULT specific property
// DEFAULT specific property

// Initialize default font

// Get text with icon id prepended
// NOTE: Useful to add icons by name id (enum) instead of
// a number that can change between ricon versions

// Get full icons data pointer

// Load raygui icons file (.rgi)
// NOTE: In case nameIds are required, they can be requested with loadIconsName,
// they are returned as a guiIconsName[iconsCount][RICON_MAX_NAME_LENGTH],
// guiIconsName[]][] memory should be manually freed!

// Style File Structure (.rgi)
// ------------------------------------------------------
// Offset  | Size    | Type       | Description
// ------------------------------------------------------
// 0       | 4       | char       | Signature: "rGI "
// 4       | 2       | short      | Version: 100
// 6       | 2       | short      | reserved

// 8       | 2       | short      | Num icons (N)
// 10      | 2       | short      | Icons size (Options: 16, 32, 64) (S)

// Icons name id (32 bytes per name id)
// foreach (icon)
// {
//   12+32*i  | 32   | char       | Icon NameId
// }

// Icons data: One bit per pixel, stored as unsigned int array (depends on icon size)
// S*S pixels/32bit per unsigned int = K unsigned int per icon
// foreach (icon)
// {
//   ...   | K       | unsigned int | Icon Data
// }

// Read icons data directly over guiIcons data array

// Draw selected icon using rectangles pixel-by-pixel

// Get icon bit data
// NOTE: Bit data array grouped as unsigned int (ICON_SIZE*ICON_SIZE/32 elements)

// Set icon bit data
// NOTE: Data must be provided as unsigned int array (ICON_SIZE*ICON_SIZE/32 elements)

// Set icon pixel value

// This logic works for any RICON_SIZE pixels icons,
// For example, in case of 16x16 pixels, every 2 lines fit in one unsigned int data element

// Clear icon pixel value

// This logic works for any RICON_SIZE pixels icons,
// For example, in case of 16x16 pixels, every 2 lines fit in one unsigned int data element

// Check icon pixel value

// RAYGUI_SUPPORT_ICONS

//----------------------------------------------------------------------------------
// Module specific Functions Definition
//----------------------------------------------------------------------------------
// Gui get text width using default font

// TODO: Consider text icon width here???

// Get text bounds considering control bounds

// Consider TEXT_PADDING properly, depends on control type and TEXT_ALIGNMENT

// NOTE: ValueBox text value always centered, text padding applies to label

// TODO: Special cases (no label): COMBOBOX, DROPDOWNBOX, LISTVIEW (scrollbar?)
// More special cases (label side): CHECKBOX, SLIDER, VALUEBOX, SPINNER

// Get text icon if provided and move text cursor
// NOTE: We support up to 999 values for iconId

// Maybe we have an icon!

// Maximum length for icon value: 3 digits + '\0'

// Move text pointer after icon
// WARNING: If only icon provided, it could point to EOL character!

// Gui draw text using default font

// Vertical alignment for pixel perfect

// Check text for icon and move cursor

// Get text position depending on alignment and iconId
//---------------------------------------------------------------------------------

// NOTE: We get text size after icon been processed

// WARNING: If only icon provided, text could be pointing to eof character!

// Check guiTextAlign global variables

// NOTE: Make sure we get pixel-perfect coordinates,
// In case of decimals we got weird text positioning

//---------------------------------------------------------------------------------

// Draw text (with icon if available)
//---------------------------------------------------------------------------------

// NOTE: We consider icon height, probably different than text size

//---------------------------------------------------------------------------------

// Gui draw rectangle using default raygui plain style with borders

// Draw rectangle filled with color

// Draw rectangle border lines with color

// TODO: For n-patch-based style we would need: [state] and maybe [control]
// In this case all controls drawing logic should be moved to this function... I don't like it...

// Draw tooltip relatively to bounds

//static int tooltipFramesCounter = 0;  // Not possible gets reseted at second function call!

// Split controls text into multiple strings
// Also check for multiple columns (required by GuiToggleGroup())

// NOTE: Current implementation returns a copy of the provided string with '\0' (string end delimiter)
// inserted between strings defined by "delimiter" parameter. No memory is dynamically allocated,
// all used memory is static... it has some limitations:
//      1. Maximum number of possible split strings is set by TEXTSPLIT_MAX_TEXT_ELEMENTS
//      2. Maximum size of text to split is TEXTSPLIT_MAX_TEXT_LENGTH
// NOTE: Those definitions could be externally provided if required

// Count how many substrings we have on text and point to every one

// Set an end of string at this point

// Convert color data from RGB to HSV
// NOTE: Color data should be passed normalized

// Value

// Undefined, maybe NAN?

// NOTE: If max is 0, this divide would cause a crash
// Saturation

// NOTE: If max is 0, then r = g = b = 0, s = 0, h is undefined

// Undefined, maybe NAN?

// NOTE: Comparing float values could not work properly
// Between yellow & magenta

// Between cyan & yellow
// Between magenta & cyan

// Convert to degrees

// Convert color data from HSV to RGB
// NOTE: Color data should be passed normalized

// NOTE: Comparing float values could not work properly

// Returns a Color struct from hexadecimal value

// Returns hexadecimal value for a Color

// Check if point is inside rectangle

// Color fade-in or fade-out, alpha goes from 0.0f to 1.0f

// Formatting of text with variables to 'embed'

// Draw rectangle with vertical gradient fill color
// NOTE: This function is only used by GuiColorPicker()

// Size of static buffer: TextSplit()
// Size of static pointers array: TextSplit()

// Split string into multiple strings

// NOTE: Current implementation returns a copy of the provided string with '\0' (string end delimiter)
// inserted between strings defined by "delimiter" parameter. No memory is dynamically allocated,
// all used memory is static... it has some limitations:
//      1. Maximum number of possible split strings is set by TEXTSPLIT_MAX_SUBSTRINGS_COUNT
//      2. Maximum size of text to split is TEXTSPLIT_MAX_TEXT_BUFFER_LENGTH

// Count how many substrings we have on text and point to every one

// Set an end of string at this point

// Get integer value from text
// NOTE: This function replaces atoi() [stdlib.h]

// Encode codepoint into utf8 text (char array length returned as parameter)

// RAYGUI_STANDALONE

// RAYGUI_IMPLEMENTATION
