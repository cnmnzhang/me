#!/usr/bin/env bash
# Compile CV from LaTeX to PDF and copy to website assets
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$REPO_DIR/assets/files"

# Check for pdflatex
if ! command -v pdflatex &> /dev/null; then
    echo "Error: pdflatex not found."
    echo ""
    echo "Install a LaTeX distribution:"
    echo "  macOS:  brew install --cask mactex-no-gui"
    echo "  Ubuntu: sudo apt install texlive-full"
    echo ""
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "Compiling CV..."
cd "$SCRIPT_DIR"
pdflatex -interaction=nonstopmode -halt-on-error main.tex
# Run twice for cross-references
pdflatex -interaction=nonstopmode -halt-on-error main.tex

cp main.pdf "$OUTPUT_DIR/cindy_zhang_cv.pdf"
echo "CV compiled and copied to assets/files/cindy_zhang_cv.pdf"

# Clean up auxiliary files
rm -f main.aux main.log main.out main.fls main.fdb_latexmk main.synctex.gz
echo "Cleaned up auxiliary files."
