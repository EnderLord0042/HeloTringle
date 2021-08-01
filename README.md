# HeloTringle

To compile on Linux, run the following command in the root folder:
```
g++ src/main.cpp -o build/StrangeWorlds -L./lib -lglfw3 -lX11 -ldl -lpthread -Wall
```
On Windows, use MinGW-64. A MinGW-64 installer is located [here](http://mingw-w64.org/doku.php/download/mingw-builds). (Note: you need to have the MinGW-64 bin folder in your path temporarily or permanently before compiling)
Once you have MinGW-64 installed, you can use this command in the root folder to compile:
```
g++ src/main.cpp -o build/StrangeWorlds -L./winlib -lglfw3 -licon -lgdi32 -Wall -m64 -static -Wl,-subsystem,windows
```
(Note: The `-Wl,-subsystem,windows` flag also disables errors from gcc. If your executable isn't launching, try removing that flag. All it does is prevent the executable from opening CMD)

On MacOS, download XCode, then run the following command in the root folder:
```
g++ src/main.cpp -o build/StrangeWorlds -L./macosLib -lglfw3 -framework Cocoa -framework OpenGL -framework IOKit -Wall
```
Because this project uses Vulkan, you must have the Vulkan SDK to compile it. Instructions on installing the Vulkan SDK are [here](https://vulkan.lunarg.com/doc/sdk/latest/linux/getting_started.html) for Linux, [here](https://vulkan.lunarg.com/doc/sdk/latest/windows/getting_started.html) for Windows, and [here](https://vulkan.lunarg.com/doc/sdk/1.2.141.2/mac/getting_started.html) for MacOS.

On any OS, to disable debug featues and compile for release, add `-D NDEBUG` to the end of the commmand.
