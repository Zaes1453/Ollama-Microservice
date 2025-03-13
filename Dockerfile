# Use a lightweight Python image
FROM python:3.11-slim

# Install system dependencies for Ollama
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
 && update-ca-certificates \
 && curl --retry 5 --retry-delay 2 -fSL https://ollama.com/install.sh -o /tmp/install.sh \
 && sh /tmp/install.sh

# Set the working directory
WORKDIR /app

# Copy ONLY requirements.txt first (better for Docker caching)
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt



# Copy app files
COPY . /app

# Expose port 5000
EXPOSE 5000

# Command to run the app
CMD ["python", "llm_service.py"]
