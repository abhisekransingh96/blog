pipeline{
    agent any
    stages {
        stage('setup python vertual env'){
        steps{
            sh '''
        chmod +x envsetup.sh
        ./envsetup.sh
        '''
        }
    }

    stage ("setup guniorn setup"){
        steps{
            sh '''
            chmod +x gunicorn.sh
            ./gunicorn.sh
            '''
        }
    }
    

    
        stage ("setup nginx setup"){
        steps{
            sh '''
            chmod +x nginx.sh
            ./nginx.sh
            '''
        }
        }
    

    }
   
        
    
}