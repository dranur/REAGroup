# REAGroup Challenge Test Implementation version 1.0

### Prerequisites

- AWS EC2
- Jenkins 

### Instructions to reviewer

In AWS Management console do the following:

- Create an Ubuntu Server 16.04 LTS (HVM), SSD Volume Type Instance on AWS EC2.
- Open port 80 and 8080 by editing the security group of the instance.
- Setup private keys to SSH into the instance.


In the EC2 instance SSH console, do the following:

- Download scripts from GitHub:

```
git clone https://github.com/dranur/REAGroup
```
- Start by installing Jenkins:

```
sh jenkins_install.sh
```
- The last line of installation output is the password to Jenkins web portal.

In your web browser type 'Instance IP address':8080 to access Jenkins web portal

- Login using the default password shown in the script output or type 
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
- Setup Jenkins to download from GitHub.
- Start the build run for the simple sinatra app pipeline.

### Some of the known issues that needs to be addressed in version 2.0

- Jenkin pipeline build can run once successful. Any attempts to run a second or subsequent time  will fail if docker image is not removed beforehand.
- The simple sinatra app in the container do not start up automatically after the container or host reboots.









