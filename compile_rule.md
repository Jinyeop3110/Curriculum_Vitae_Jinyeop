# Compile Rules

## Overview
This project uses XeLaTeX to compile resume files. All auxiliary files (`.log`, `.aux`, `.out`) are output to the `build/` folder to keep the root directory clean.

## Main Files
- `Resume_AI4Science.tex` - AI for Science positions
- `Resume_coreAI.tex` - Core AI/ML positions
- `Resume_genetech.tex` - Genentech/biotech positions
- `Résumé_Bio.tex` - Biology-focused positions

## Compile Command

### Single file
```bash
xelatex -output-directory=build -interaction=nonstopmode <filename>.tex
mv build/<filename>.pdf .
```

### All files
```bash
./compile.sh
```

## Compile Script
The `compile.sh` script will:
1. Compile all 4 main tex files
2. Run twice to resolve cross-references
3. Move PDFs to root directory
4. Keep auxiliary files in `build/`

## Directory Structure
```
.
├── *.tex              # Main resume files
├── *.pdf              # Generated PDFs (output)
├── build/             # Auxiliary files (.log, .aux, .out)
├── fonts/             # Font files
├── resume/            # Resume section components
└── deprecated/        # Old resume versions
```

## Custom Commands

### `\textsemibold{text}`
Renders text in Roboto SemiBold font. Use for emphasis on institution names:
```latex
{\textsemibold{Massachusetts Institute of Technology (MIT)}}
{\textsemibold{MIT–IBM Watson AI Lab}}
```

## Requirements
- XeLaTeX (part of TeX Live or MacTeX)
- Fonts in `fonts/` directory (includes Roboto-SemiBold.ttf)

## Cleaning
To remove all auxiliary files:
```bash
rm -rf build/*
```
