pipeline{
    agent{
        docker {
            image 'robotframework/rfdocker:latest'
        }
    }
    withPythonEnv('python3'){
        steps{
            sh 'python --version'
            sh "pip install --upgrade robotframework-screencaplibrary"
            sh "pip install robotframework-seleniumlibrary"
            }
    }
    stages{
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