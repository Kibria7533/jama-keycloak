#!/bin/bash
# Define the Keycloak base directory
KEYCLOAK_DIR="/opt/keycloak/keycloak-26.0.7"

# Check if Keycloak is already running
if ! pgrep -f "keycloak.*org.jboss" > /dev/null; then
    echo "Starting Keycloak..."
    nohup $KEYCLOAK_DIR/bin/kc.sh start --hostname=$(hostname -f) > $KEYCLOAK_DIR/logs/keycloak.log 2>&1 &
else
    echo "Keycloak is already running."
fi
