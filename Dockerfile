# Step 1: Use slim Python image
FROM python:3.10-slim

# Step 2: Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Step 3: Create and set working directory
WORKDIR /usr/ML/app

# Step 4: Copy all project files to the container
COPY . /usr/ML/app

# Step 5: Install system dependencies (if needed)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Step 6: Upgrade pip and install required Python packages
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Step 7: Expose port 5000 for Flask app
EXPOSE 5000

# Step 8: Command to run the Flask app
CMD ["python", "flask_api.py"]

# # Use a Python-based image instead of Anaconda
# FROM python:3.8-slim

# #Copy the current folder structure and content to docker folder
# COPY . /usr/ML/app

# #Expose the port within docker 
# EXPOSE 5000

# #Set current working directory
# WORKDIR /usr/ML/app

# #Install the required libraries
# RUN pip install -r requirements.txt

# #container start up command
# CMD python flask_api.py

# # Use a Python-based image instead of Anaconda
# FROM python:3.8-slim

# # Set environment variables for Flask
# ENV FLASK_APP=flask_api.py
# ENV FLASK_ENV=development

# # Copy the current folder structure and content to the docker folder
# COPY . /usr/ML/app

# # Set current working directory
# WORKDIR /usr/ML/app

# # Expose the port within docker
# EXPOSE 5000

# # Install the required libraries
# RUN pip install -r requirements.txt

# # Container startup command
# CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

