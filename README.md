# BlobEditor
A simple raylib + D project.

# Clone this repository (with all submodules!)

```git clone --recurse-submodules https://github.com/trikko/BlobEditor```

# Compile Raylib 3.0.0 dependency with RayGui

From base project directory:

```
cp ext/raygui/src/*.h ext/raylib/src
cd ext/raylib/src/
make PLATFORM=PLATFORM_DESKTOP RAYLIB_MODULE_RAYGUI=TRUE RAYLIB_MODULE_RAYGUI_PATH=../../raygui/src CFLAGS+="-DRAYGUI_SUPPORT_ICONS"
sudo make install PLATFORM=PLATFORM_DESKTOP RAYLIB_MODULE_RAYGUI=TRUE RAYLIB_MODULE_RAYGUI_PATH=../../raygui/src CFLAGS+="-DRAYGUI_SUPPORT_ICONS"
```

# Make sure you have a D compiler installed

I suggest you to install ldc2 to get best performances. [Here the binary for you platform](https://github.com/ldc-developers/ldc/releases)

You can also use dmd compiler, but it generates slower executable. [You can dowload from official website](https://dlang.org/)

# Compile BlobEditor

If you installed ldc2:
```dub --compiler=ldc2 --b=release-nobounds```

if you installed dmd:
```dub  --b=release-nobounds```

