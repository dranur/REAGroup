# REAGroup
REAGroup Challenge Test Implementation version 1.0

Pre-requisites:

1. AWS EC2 free tier - Ubuntu Server 16.04 LTS (HVM), SSD Volume Type 
2. Jenkins installation using Jenkins_installation.sh


Instructions to reviewer:

In AWS Management console do the following:

1. Create an Ubuntu Server 16.04 LTS (HVM), SSD Volume Type Instance on AWS EC2
2. Open port 80 and 8080 by editing the security group of the instance


In the EC2 instance, do the following:

1. Download scripts from GitHub:

git clone https://github.com/dranur/REAGroup

2. Start by installing Jenkins:

sh jenkins_install.sh

3. The last line of installation output is the password to Jenkins web portal

In your web browser type <Instance IP address>:8080 to access Jenkins web portal

1. Login using the default password
2. Setup Jenkins to download from GitHub
3. Build the simple sinatra app pipeline









