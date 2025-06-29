
#FROM python:3.10-slim

# Set working directory inside container
#WORKDIR /app

# Copy all files from local directory to container
#COPY . .

# Install required libraries
#RUN pip install openai

# Run your script when container starts
#CMD ["python", "test2.py"]

# Base Image
FROM ubuntu:20.04

# Disable interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-venv \
        python3-pip \
        nano \
        findutils \
        psutils \
        jupyter-notebook \
        less \
        curl \
        wget \
        git && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy the bash menu script to the container
COPY menu.sh /app/menu.sh

# Make the script executable
RUN chmod +x /app/menu.sh

# Start the script when container runs
CMD ["/bin/bash", "/app/menu.sh"]

