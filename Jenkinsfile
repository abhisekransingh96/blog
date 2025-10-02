pipeline{
    agent any
    stages {
        stage('setup python vertual env'){
        steps{
            sh '''
        chomd +x envsetup.sh
        ./envsetup.sh
        '''
        }
    }

    stage ("setup guniorn setup"){
        steps{
            sh '''
            chomd +x gunicorn.sh
            ./gunicorn.sh
            '''
        }
    }
    

    
        stage ("setup nginx setup"){
        steps{
            sh '''
            chomd +x nginx.sh
            ./nginx.sh
            '''
        }
        }
    

    }
   
        
    
}