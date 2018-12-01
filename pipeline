pipeline {
    agent any
    stages {
        stage('Prepare Host') {
            steps {
                sh '''
                sudo apt-get update
                sudo apt-get install -y net-tools
                sudo apt-get install -y iputils-ping
                '''
            }
        }
    
        stage('Install Docker') {
            steps {
                sh '''
                sudo curl -fsSL https://get.docker.com -o get-docker.sh
                sudo sh get-docker.sh
                sudo usermod -aG sudo ubuntu
                '''
            }
        }
        
        stage('Create Sinatra Docker') {
            steps {
                sh '''
                    sudo docker run -d -p 80:80 --name sinatra --restart unless-stopped -t ubuntu:16.04
                    sudo docker exec sinatra apt-get update
                    sudo docker exec sinatra apt-get install -y git
                    sudo docker exec sinatra apt-get install -y bundler
                    sudo docker exec sinatra git clone https://github.com/rea-cruitment/simple-sinatra-app.git
                    sudo docker exec sinatra bash -c "cd /simple-sinatra-app && bundle install"
                    sudo docker exec sinatra bash -c "cd /simple-sinatra-app && bundle exec rackup -p80 --host 0.0.0.0 -D"
                '''
            }
        }
        
        stage('Secure Host') {
            steps {
                sh '''
                sudo apt-get update
                sudo apt-get install -y fail2ban
                sudo systemctl enable fail2ban
                sudo systemctl start fail2ban

                sudo apt-get -y --no-install-recommends install rkhunter
                sudo rkhunter --propupd

                sudo ufw default allow outgoing
                sudo ufw default deny incoming
                sudo ufw allow ssh/tcp
                sudo ufw limit ssh/tcp
                sudo ufw allow http/tcp
                sudo ufw allow 8080/tcp
                sudo ufw logging on
                sudo ufw --force enable
                '''
            }
        }
        stage('Host startup') {
            steps {
                sh '''
                sudo sed -i -e '$i sudo docker exec sinatra bash -c "cd /simple-sinatra-app && /usr/bin/bundle exec /usr/local/bin/rackup -p80 --host 0.0.0.0 -D" \n' /etc/rc.local
 
                '''
            }
        } 
       
        
    }
}
