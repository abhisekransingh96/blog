pipeline{
    agent any
    stage {
        stage('setup python vertual env')
        sh '''
        chomd +x envsetup.sh
        ./envsetup.sh
        '''
    

    }
    stage{
        stage ("setup guniorn setup")
        step{
            sh '''
            chomd +x gunicorn.sh
            ./gunicorn.sh
            '''
        }
    }

    stage{
        stage ("setup nginx setup")
        step{
            sh '''
            chomd +x nginx.sh
            ./nginx.sh
            '''
        }
    }
}