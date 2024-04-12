# Docker Integration with Continuous Deployment and Release

This project demonstrates the integration of Docker with continuous deployment and release for typical Java or Python applications. The Jenkinsfile provided below outlines the CI/CD pipeline stages, and the Dockerfile defines the Docker image configuration.

## Project Structure

![img](https://github.com/Vio-ss/demo7/assets/77194486/c35948c9-b39b-4f72-9c66-3c77337e82ab)

## Getting Started

To get started with the project, follow these instructions:

### Prerequisites

- Install Jenkins and Docker Desktop on your system.

### Installation

1. Create a new Jenkins pipeline job.

2. Configure the pipeline to use the provided Jenkinsfile or paste the pipeline script directly into the pipeline script section.

3. Save and run the pipeline job.


## Jenkins Pipeline Configuration

```groovy
pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Vio-ss/demo7'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    bat "docker build -t worldjavaapp ."
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker', variable: 'dockerhub')]) {
                        bat "docker login -u swesiva -p ${dockerhub}"
                    }
                }
            }
        }
        stage('Docker Test') {
            steps {
                script {
                    bat "docker tag worldjavaapp swesiva/worldjavaapp"
                    bat "docker push swesiva/worldjavaapp:latest"
                }
            }
        }
    }
}
