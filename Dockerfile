# Use the official Python image
FROM python:3.11.9

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements first to leverage Docker's caching
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port that Streamlit runs on
EXPOSE 8501

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0"]
