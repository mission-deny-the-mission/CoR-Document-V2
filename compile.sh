#!/bin/bash
# Compile the Typst document
echo "Compiling main.typ..."
typst compile main.typ
if [ $? -eq 0 ]; then
    echo "Compilation successful! PDF generated: main.pdf"
else
    echo "Compilation failed!"
    exit 1
fi