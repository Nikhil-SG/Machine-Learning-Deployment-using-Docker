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

# Use a Python-based image instead of Anaconda
FROM python:3.8-slim

# Set environment variables for Flask
ENV FLASK_APP=flask_api.py
ENV FLASK_ENV=development

# Copy the current folder structure and content to the docker folder
COPY . /usr/ML/app

# Set current working directory
WORKDIR /usr/ML/app

# Expose the port within docker
EXPOSE 5000

# Install the required libraries
RUN pip install -r requirements.txt

# Container startup command
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

