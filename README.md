# REAGroup Challenge Test Implementation Solution

### Prerequisites

- AWS EC2 Ubuntu Server 16.04
- Jenkins 

### Overview

These scripts run on a AWS EC2 Ubuntu Server 16.04 instance which serves as a host to Docker container running Simple Sinatra app. Jenkins is used as a 'configuration-as-code' tool to automate the process of building the Docker container and securing the host machine.

### Instructions to reviewer

In AWS Management console do the following:

- Create an Ubuntu Server 16.04 LTS (HVM), SSD Volume Type Instance on AWS EC2
- Open port 80 and 8080 by editing the security group of the instance
- Setup private keys to SSH into the instance using PuTTY
- Login as user ubuntu@InstanceIPaddress


In the EC2 instance SSH console, do the following:

- Download scripts from GitHub:

```
git clone https://github.com/dranur/REAGroup
```
- Start by installing Jenkins:

```
sh jenkins_install.sh
```
- The last line of installation output is the password to Jenkins web portal or retrieve it using
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

In your web browser type 'Instance IP address':8080 to access Jenkins web portal:

- Login using the default password retrieved from previous step
- Select or click on these recommended steps: Install suggested plugins -> continue as admin -> not now -> start using Jenkins -> Create a new jobs -> name item as 'simple-sinatra-app' -> Pipeline
- Configure Pipeline to download from Github in the 'Configure' page by selecting Pipeline script from SCM -> Git and copy the following URL into Repository URL:
```
https://github.com/dranur/REAGroup
```

![Jenkins](https://github.com/dranur/REAGroup/blob/master/jenkins-github.png)

- Save settings and start the build run for the 'simple-sinatra-app' pipeline by clicking on 'Build now' button
- Once all pipeline stages completed successfully, open a new browser window and type your InstanceIPaddress and you should see Hello World!

### Some of the known issues that need to be address in future versions

- Jenkin pipeline build can run once successful. Any attempts to run a second or subsequent times  will fail if docker image is not removed beforehand.
- The simple sinatra app in the container do not start up automatically after the container or host reboots.

