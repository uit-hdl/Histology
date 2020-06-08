# Use an official Python runtime as a parent image
FROM python:3.8.3-slim-buster

RUN apt-get update && apt-get install -y libopenslide-dev git gcc

# Clone the histology application repository
RUN git clone https://github.com/gronnesby/histology
WORKDIR /histology

# Setuptools version > 45 fails with an import error
RUN pip3 install --upgrade setuptools==45
# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt
RUN pip3 install requests

EXPOSE 5000
EXPOSE 80

# Run application.py when the container launches
CMD ["python3", "application.py"]
