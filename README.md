# REAGroup
REAGroup Challenge Test Implementation version 1.0

Pre-requisites:

1. AWS EC2 free tier - Ubuntu Server 16.04 LTS (HVM), SSD Volume Type 
2. Jenkins installation using Jenkins_install.sh

Instructions to reviewer:

In AWS Management console do the following:

1. Create an Ubuntu Server 16.04 LTS (HVM), SSD Volume Type Instance on AWS EC2.
2. Open port 80 and 8080 by editing the security group of the instance.
3. Setup private keys to SSH into the instance.


In the EC2 instance SSH console, do the following:

1. Download scripts from GitHub:

```
git clone https://github.com/dranur/REAGroup
```
2. Start by installing Jenkins:

```
sh jenkins_install.sh
```
3. The last line of installation output is the password to Jenkins web portal.

In your web browser type 'Instance IP address':8080 to access Jenkins web portal

1. Login using the default password shown in the script output or type sudo cat /var/lib/jenkins/secrets/initialAdminPassword
2. Setup Jenkins to download from GitHub.
3. Start the build run for the simple sinatra app pipeline.

Some of the known issues that needs to be addressed in version 2.0:
1. Jenkin pipeline build can run once successful. Any attempts to run a second or subsequent time  will fail if docker image is not removed beforehand.
2. The simple sinatra app in the container do not start up automatically after the container or host reboots.









