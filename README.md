# REAGroup Challenge Test Implementation version 1.0

### Prerequisites

- AWS EC2
- Jenkins 

### Instructions to reviewer

In AWS Management console do the following:

- Create an Ubuntu Server 16.04 LTS (HVM), SSD Volume Type Instance on AWS EC2
- Open port 80 and 8080 by editing the security group of the instance
- Setup private keys to SSH into the instance


In the EC2 instance SSH console, do the following:

- Download scripts from GitHub:

```
git clone https://github.com/dranur/REAGroup
```
- Start by installing Jenkins:

```
sh jenkins_install.sh
```
- The last line of installation output is the password to Jenkins web portal or retrieve it
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

In your web browser type 'Instance IP address':8080 to access Jenkins web portal

- Login using the default password retrieve from previous step
- Select or click on these recommended steps: Install suggested plugins -> continue as admin -> not now -> start using Jenkins -> Create a new job -> name job as 'simple-sinatra-app' -> pipeline
- Configure pipeline job to download from Github in the 'Configure' page:

![Jenkins](https://github.com/dranur/REAGroup/blob/master/jenkins-github.png)

- Start the build run for the 'simple-sinatra-app' pipeline by clicking on 'Build now' button

### Some of the known issues that needs to be addressed in future versions

- Jenkin pipeline build can run once successful. Any attempts to run a second or subsequent time  will fail if docker image is not removed beforehand.
- The simple sinatra app in the container do not start up automatically after the container or host reboots.









