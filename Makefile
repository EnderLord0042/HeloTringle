# TODO: FIX ISSUES WITH WINDOWS PUTTING OBJECT FILES IN THE SRC DIRECTORY

ifeq ($(OS),Windows_NT) # Check if it's running on Windows or Unix
    detected_OS := Windows
else
    detected_OS := $(shell uname)
endif

CC := g++ # This is the main compiler
SRCDIR := src
BUILDDIR := build
TARGET := bin/StrangeWorlds
SRCEXT := cpp

ifeq ($(detected_OS),Windows) # Check if it's Windows
	SOURCES := $(shell dir /b/s $(SRCDIR)\*.$(SRCEXT))
	LIB := -L./winlib -lglfw3 -licon -lgdi32 -m64 -static -Wl,-subsystem,windows
endif
ifeq ($(detected_OS),Darwin) # Check if it's Mac OS
	SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
	LIB := -L./macosLib -lglfw3 -framework Cocoa -framework OpenGL -framework IOKit
endif
ifeq ($(detected_OS),Linux) # Check if it's Linux
	SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
	LIB := -L./lib -lglfw3 -lGL -lX11 -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor
endif

OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS := -Wall
INC := -I include

$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@echo " $(CC) $^ -o $(TARGET) $(LIB)"; $(CC) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(TARGET)

.PHONY: clean
