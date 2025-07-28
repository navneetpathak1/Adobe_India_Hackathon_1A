# PDF Outline Extractor

This Dockerized Python solution extracts titles and headings from PDF files using PyMuPDF and Tesseract OCR.

---

## Features

- Extracts document title and headings (H1, H2, H3…) from PDFs
- Uses OCR fallback for scanned PDFs via Tesseract
- Removes headers, footers, and tables to improve extraction quality
- Batch processes all PDFs in an input directory
- Outputs structured JSON files per PDF
- Runs fully offline inside a Docker container

---

## Requirements

- Docker installed on your machine
- Input PDF files placed inside an `input` folder
- Sufficient disk space for outputs

---

## Usage

### 1. Build the Docker image

Run this command in your project directory (where the `Dockerfile` is):

```bash
docker build --platform linux/amd64 -t mysolutionname:somerandomidentifier .
```

### 2. Run the Docker container

**On Linux/macOS (bash/zsh):**

```bash
docker run --rm -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output --network none mysolutionname:somerandomidentifier
```
On Windows PowerShell:

```bash
docker run --rm -v ${PWD}/input:/app/input -v ${PWD}/output:/app/output --network none mysolutionname:somerandomidentifier
```

Push the image to Docker Hub
```bash
docker tag mysolutionname:somerandomidentifier navneetpathak1909/mysolutionname:somerandomidentifier
docker login
docker push navneetpathak1909/mysolutionname:somerandomidentifier
```
Folder Structure Example
```bash
project-root/
├── Dockerfile
├── final.py
├── requirements.txt
├── input/
│   ├── example1.pdf
│   └── example2.pdf
└── output/
```
