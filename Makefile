# Makefile for Minecraft Deobfuscator 3000

SRC_DIR = src
OUT_DIR = bin
LIB_DIR = lib
JFX_LIB = $(LIB_DIR)/javafx-sdk-17.0.13/lib

# Find all Java source files
SOURCES = $(shell find $(SRC_DIR) -name "*.java")

# Find all JAR files in libs for classpath (excluding the sdk folder itself which is handled separately)
LIBS = $(wildcard $(LIB_DIR)/*.jar)

# JavaFX Jars
JFX_JARS = $(wildcard $(JFX_LIB)/*.jar)

# Construct classpath
# We need to replace spaces with colons for the classpath argument
empty :=
space := $(empty) $(empty)
CLASSPATH_LIBS = $(subst $(space),:,$(LIBS))
CLASSPATH_JFX = $(subst $(space),:,$(JFX_JARS))
CLASSPATH = $(CLASSPATH_LIBS):$(CLASSPATH_JFX)

# Main class
MAIN_CLASS = org.ugp.mc.deobfuscator.Main

.PHONY: all compile run clean setup

all: compile

setup:
	./setup_javafx.sh

compile: setup
	mkdir -p $(OUT_DIR)
	javac -d $(OUT_DIR) -cp "$(CLASSPATH)" $(SOURCES)
	@echo "Copying assets..."
	mkdir -p $(OUT_DIR)/org/ugp/mc/deobfuscator/assets
	cp -r $(SRC_DIR)/org/ugp/mc/deobfuscator/assets/* $(OUT_DIR)/org/ugp/mc/deobfuscator/assets/
	@echo "Build complete."

run: compile
	java --module-path $(JFX_LIB) --add-modules javafx.controls,javafx.fxml -cp "$(OUT_DIR):$(CLASSPATH)" $(MAIN_CLASS)

clean:
	rm -rf $(OUT_DIR)
