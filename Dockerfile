FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

ENV VIRTUAL_ENV=/opt/.venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

## Step 2:
# Copy source code to working directory
COPY . requirements.txt app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org --no-cache-dir -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host", "0.0.0.0"]

