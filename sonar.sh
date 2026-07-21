# Update system
apt update -y
apt upgrade -y

# Install Java 17 (required for SonarQube 10.5.1)
apt install openjdk-17-jdk unzip wget -y

# Set Java 17 as default
update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-openjdk-amd64/bin/java 1
update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

# Verify Java version
java -version

# Go to /opt
cd /opt

# Clean up any old SonarQube folders
rm -rf sonarqube sonarqube-*

# Download SonarQube 10.5.1
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.5.1.90531.zip

# Extract SonarQube
unzip sonarqube-10.5.1.90531.zip
mv sonarqube-10.5.1.90531 sonarqube

# Create sonar user if not exists
id -u sonar &>/dev/null || useradd -m -d /opt/sonar -s /bin/bash sonar
chown -R sonar:sonar /opt/sonarqube

# Start SonarQube as sonar user
sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Check status
sudo -u sonar /opt/sonarqube/bin/linux-x86-64/sonar.sh status
