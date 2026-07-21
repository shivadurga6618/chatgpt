sudo dnf install java-21-amazon-corretto -y

Jenkins setup

# Update system
sudo apt update -y
sudo apt upgrade -y

# Install Java (IMPORTANT → use Java 21)
sudo apt install -y openjdk-21-jdk fontconfig

# Verify Java
java -version

# Remove old Jenkins repo (if any)
sudo rm -f /etc/apt/sources.list.d/jenkins.list

# Add NEW Jenkins 2026 key (NOT 2023)
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key \
| sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repo
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
| sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null


# Update repo
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Set JAVA_HOME (VERY IMPORTANT)
echo 'JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64' | sudo tee -a /etc/default/jenkins





# Start Jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check status
sudo systemctl status Jenkins
