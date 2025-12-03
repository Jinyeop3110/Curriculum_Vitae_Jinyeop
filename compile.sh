#!/bin/bash

# Compile all resume tex files
# Outputs auxiliary files to build/ and PDFs to root

BUILD_DIR="build"
mkdir -p "$BUILD_DIR"

FILES=(
    "Resume_AI4Science"
    "Resume_coreAI"
    "Resume_genetech"
    "Résumé_Bio"
)

echo "Compiling resumes..."

for file in "${FILES[@]}"; do
    echo "  Compiling ${file}.tex..."
    xelatex -output-directory="$BUILD_DIR" -interaction=nonstopmode "${file}.tex" > /dev/null 2>&1 || true
done

# Second pass for cross-references
echo "Second pass for cross-references..."
for file in "${FILES[@]}"; do
    xelatex -output-directory="$BUILD_DIR" -interaction=nonstopmode "${file}.tex" > /dev/null 2>&1 || true
done

# Move PDFs to root
echo "Moving PDFs to root directory..."
for file in "${FILES[@]}"; do
    if [ -f "$BUILD_DIR/${file}.pdf" ]; then
        mv "$BUILD_DIR/${file}.pdf" .
    else
        echo "  Warning: ${file}.pdf not generated"
    fi
done

echo ""
echo "Done! Generated PDFs:"
ls -lh *.pdf 2>/dev/null || echo "No PDFs found"
