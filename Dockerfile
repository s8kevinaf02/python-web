#Use Ubuntu as the base image
  
FROM ubuntu:latest

# Set the working directory in the container

WORKDIR /app

# Update the package list and install python3 and pip

RUN apt update -y && apt install -y python3 python3-pip

# Copy the Python application code to the working directory

COPY requirements.txt /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Copy the entire content
COPY . .

# Set the entrypoint and cmd for the container
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000]