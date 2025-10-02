pipeline{
    agent any
    stage {
        stage('setup python vertual env'){
        steps{
            sh '''
        chomd +x envsetup.sh
        ./envsetup.sh
        '''
        }
    }
    

    }
    stage{
        stage ("setup guniorn setup"){
        steps{
            sh '''
            chomd +x gunicorn.sh
            ./gunicorn.sh
            '''
        }
    }
    }

    stage{
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