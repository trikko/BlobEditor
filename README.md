# BlobEditor
A simple webasm project using raylib. [Try it online now!](https://www.andreafontana.it/BlobEditor/)

## Demo
[![Demo of BlobEditor](https://github.com/trikko/BlobEditor/raw/main/output.gif)](https://www.andreafontana.it/BlobEditor/)

# Build & run
BlobEditor uses emscripten to compile C code.

## Step #1: Install emscripten
Follow instructions [here](https://emscripten.org/docs/getting_started/downloads.html)

## Step #2: Clone this repository and its submodules
```git clone --recurse-submodules https://github.com/trikko/BlobEditor/```

## Step #3: Compile everything
Make sure you activated the emscripten tools as explained [here](https://emscripten.org/docs/getting_started/downloads.html) if required. Let's compile the project:
```
cd BlobEditor
make
```

## Step #4: Serve BlobEditor
You can't run webassembly from your filesystem, so you need to serve the ```html``` folder using a (local) webserver.

For the sake of simplicity I use a very simple project written in [dlang](https://dlang.org) that you can start running the command ```dub``` inside the ```server``` folder (but you can use any webserver you like)
