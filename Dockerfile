# Use an official Python runtime as a parent image
FROM python:3.7

# Set the working directory to /app
WORKDIR /app

# Copy the app source to the container
COPY . .

# Install virtualenv
RUN pip install virtualenv

# Create a virtual environment and activate it
RUN virtualenv --python=python3 venv
RUN . venv/bin/activate

# Install the app's dependencies
RUN pip install -r requirements.txt

# Run database migrations
RUN python3 manage.py migrate

# Start the server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

