vim jenkins.sh
sh jenkins.sh 
systemctl start jenki
systemctl status jenkins
sudo apt update
sudo apt install maven -y
mvn -version
~           
cat /var/lib/jenkins/secrets/initialAdminPassword
sudo apt install git -y
ll
vim sonar.sh
sh sonar.sh 
ll
id -u sonar &>/dev/null || useradd -m -d /opt/sonar -s /bin/bash sonar
chown -R sonar:sonar /opt/sonarqube
sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh start
sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh status
cd var/lib
