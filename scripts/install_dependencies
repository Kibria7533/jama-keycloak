#!/bin/bash
# Ensure the system is up-to-date
yum update -y

# Install wget if not available
yum install -y wget

# Add the OpenJDK 21 repository (Amazon Linux/RedHat-based systems)
cat <<EOF > /etc/yum.repos.d/adoptium.repo
[Adoptium]
name=Adoptium OpenJDK
baseurl=https://packages.adoptium.net/artifactory/rpm/centos/7/x86_64
enabled=1
gpgcheck=0
EOF

# Install Java 21
yum install -y temurin-21-jdk

# Verify Java installation
java -version

# Create required directories for Keycloak
mkdir -p /opt/keycloak/

# Set proper permissions
chown -R ec2-user:ec2-user /opt/keycloak/
chmod -R 755 /opt/keycloak/
