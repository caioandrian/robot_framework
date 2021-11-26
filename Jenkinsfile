pipeline{
    agent{
        docker {
            image 'robotframework/rfdocker:latest'
        }
    }
    stages{
        withPythonEnv('python'){
            steps{
                sh "pip install --upgrade robotframework-screencaplibrary"
                sh "pip install robotframework-seleniumlibrary"
            }
        }
        stage('Setup'){
            steps{
                sh "npm ci"
            }
        }
        stage('Tests'){
            steps{
                sh "npm run robot:selenium"
            }
        }
    }
}