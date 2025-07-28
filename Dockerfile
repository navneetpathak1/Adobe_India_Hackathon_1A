# Base image with Python and Tesseract OCR
FROM python:3.10-slim

# Ensure correct platform
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    tesseract-ocr \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements (you can optimize this later)
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy your script
COPY final.py .

# Entrypoint: auto-process input PDFs and exit
ENTRYPOINT ["python", "final.py", "/app/input", "/app/output"]
