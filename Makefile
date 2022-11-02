.DEFAULT_GOAL := vasaro-web

libraylib.a: ext/raylib/src/*.c
	mkdir -p build/raylib
	emcc -c ext/raylib/src/rcore.c -o build/raylib/rcore.o -Os -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
	emcc -c ext/raylib/src/rshapes.c -o build/raylib/rshapes.o -Os -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
	emcc -c ext/raylib/src/rtextures.c -o build/raylib/rtextures.o -Os -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
	emcc -c ext/raylib/src/rtext.c -o build/raylib/rtext.o -Os -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
	emcc -c ext/raylib/src/rmodels.c -o build/raylib/rmodels.o -Os -DPLATFORM_WEB -DGRAPHICS_API_OPENGL_ES2
	emcc -c ext/raylib/src/utils.c -o build/raylib/utils.o -Os -DPLATFORM_WEB
	emcc -c ext/raylib/src/raudio.c -o build/raylib/raudio.o -Os -DPLATFORM_WEB
	emcc -c ext/raylib/src/raygui.c -o build/raylib/raygui.o -Os -DPLATFORM_WEB -DRAYGUI_IMPLEMENTATION
	emar rcs libraylib.a build/raylib/rcore.o build/raylib/rshapes.o build/raylib/rtextures.o build/raylib/rtext.o build/raylib/rmodels.o build/raylib/utils.o build/raylib/raudio.o build/raylib/raygui.o

build/hashmap.o : hashmap.c
	mkdir -p build
	emcc -c hashmap.c -o build/hashmap.o -Os -Wall -DPLATFORM_WEB -Iext/raylib/src/

build/blob.o: blob.c
	mkdir -p build
	emcc -c blob.c -o build/blob.o -Os -Wall -DPLATFORM_WEB -Iext/raylib/src/

build/opensimplexnoise.o: opensimplexnoise.c
	mkdir -p build
	emcc -c opensimplexnoise.c -o build/opensimplexnoise.o -Os -Wall -DPLATFORM_WEB -Iext/raylib/src/

vasaro-web: build/blob.o build/hashmap.o build/opensimplexnoise.o libraylib.a
	emcc -o html/blob.html build/*.o libraylib.a -Os -Wall -I. -L. -sALLOW_MEMORY_GROWTH -s ASSERTIONS=1 -s USE_GLFW=3 -s TOTAL_MEMORY=67108864 -s FORCE_FILESYSTEM=1 -DPLATFORM_WEB -s EXPORTED_RUNTIME_METHODS=["cwrap"] -s EXPORTED_FUNCTIONS='["_main", "_resize"]' --preload-file resources@resources

clean:
	rm -rf build/ libraylib.a

