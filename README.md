# house-price-prediction-microservice-sklearn-kubernetes
[![HousePricePredictor](https://circleci.com/gh/tomlui2010/house-price-prediction-microservice-sklearn-kubernetes.svg?style=svg)](https://circleci.com/gh/tomlui2010/house-price-prediction-microservice-sklearn-kubernetes)


# Project Summary

# House Price Predictor

## Description
This project is a command line application that helps users track their predict housing prices in Boston. It uses a pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. 

## Features
- pre-trained, sklearn model trained on Kaggle dataset (https://www.kaggle.com/c/boston-housing)
- Dockerized app with lint checking using Hadolint
- Prediction function is exposed as an api
- Application can be deployed on a kubernetes cluster. Locally tested on minkube.
- CircleCI build

## Installation
### Prerequisites
- Python 3.7+
- Flask
- Docker 
- minikube

### Steps to run locally
1. Clone the repository:
   ```sh
   git clone https://github.com/tomlui2010/house-price-prediction-microservice-sklearn-kubernetes
   cd house-price-prediction-microservice-sklearn-kubernetes
2. Create and activate a virtual environment
   ```sh
   python3 -m venv ~/.devops
   source ~/.devops/bin/activate
3. Install Dependencies
   ```sh
   make setup
   make install
4. Lint check
   ```sh
   make lint
5. Run the app
    ```sh
    python3 app.py

### Steps to run as docker container
1. Clone the repository:
   ```sh
   git clone https://github.com/tomlui2010/house-price-prediction-microservice-sklearn-kubernetes
   cd house-price-prediction-microservice-sklearn-kubernetes
2. Create and activate a virtual environment
   ```sh
   python3 -m venv ~/.devops
   source ~/.devops/bin/activate
3. Install Dependencies
   ```sh
   make setup
   make install
4. Lint check
   ```sh
   make lint
5. Run the docker container and publish to Dockerhub
    ```sh
    ./run_docker.sh
    ./upload_docker.sh

### Steps to run on Kubernetes cluster
1. Clone the repository:
   ```sh
   git clone https://github.com/tomlui2010/house-price-prediction-microservice-sklearn-kubernetes
   cd house-price-prediction-microservice-sklearn-kubernetes
2. Create and activate a virtual environment
   ```sh
   python3 -m venv ~/.devops
   source ~/.devops/bin/activate
3. Install Dependencies
   ```sh
   make setup
   make install
4. Lint check
   ```sh
   make lint
5. Install minikube and virtualbox (mac)
    ```sh
    brew install virtualbox
    brew install minikube
5. Run on kubernetes cluster
    ```sh
    ./run_kubernetes.sh

## Important files
.circleci/config.yml - CircleCI config file
model_data/boston_housing_prediction.joblib - Kaggle dataset
output_txt_files/docker_out.txt - output when app was run as a docker container
output_txt_files/kubernetes_out.txt - output when app was on kubernetes cluster
make_prediction.sh - script to run to test the prediction api
requirements.txt - all Python dependencies to be installed
run_docker.sh - script tp run app as a docker container
run_kubernetes.sh - script to run app on a kubernetes cluster
upload_docker.sh - script to push the successfully build docker image on to Dockerhub
