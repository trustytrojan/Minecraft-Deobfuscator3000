#!/bin/bash

JFX_VERSION="17.0.13"
JFX_ZIP="openjfx-${JFX_VERSION}_linux-x64_bin-sdk.zip"
JFX_URL="https://download2.gluonhq.com/openjfx/${JFX_VERSION}/${JFX_ZIP}"
LIB_DIR="lib"
JFX_DIR="${LIB_DIR}/javafx-sdk-${JFX_VERSION}"

mkdir -p ${LIB_DIR}

if [ ! -d "${JFX_DIR}" ]; then
    echo "Downloading JavaFX ${JFX_VERSION} SDK..."
    curl -L -o "${LIB_DIR}/${JFX_ZIP}" "${JFX_URL}"
    
    echo "Extracting JavaFX SDK..."
    unzip -q "${LIB_DIR}/${JFX_ZIP}" -d "${LIB_DIR}"
    
    # Cleanup zip
    rm "${LIB_DIR}/${JFX_ZIP}"
    
    echo "JavaFX SDK setup complete."
else
    echo "JavaFX SDK already exists in ${JFX_DIR}"
fi
