# Sample Dockerfile — minimal Python web app
# Usage:
#   docker build -t myapp:1.0 -f sample.Dockerfile .
#   docker run -p 5000:5000 myapp:1.0

FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies first (cached as a separate layer)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Expose the port the app listens on
EXPOSE 5000

# Default command
CMD ["python", "app.py"]
