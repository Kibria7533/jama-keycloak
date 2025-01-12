#!/bin/bash
# Define the Keycloak base directory
KEYCLOAK_DIR="/opt/keycloak/keycloak-26.0.7"

# Define environment variables for the admin user
export KC_BOOTSTRAP_ADMIN_USERNAME="admin"
export KC_BOOTSTRAP_ADMIN_PASSWORD="admin-password"

# Ensure the logs directory exists
LOG_DIR="$KEYCLOAK_DIR/logs"
mkdir -p $LOG_DIR

# Check if Keycloak is already running
if ! pgrep -f "keycloak.*org.jboss" > /dev/null; then
    echo "Starting Keycloak..."
    nohup $KEYCLOAK_DIR/bin/kc.sh start --hostname=$(hostname -f) > $LOG_DIR/keycloak.log 2>&1 &
    sleep 5  # Give some time for Keycloak to initialize
    if pgrep -f "keycloak.*org.jboss" > /dev/null; then
        echo "Keycloak started successfully."
        echo "Logs are available at $LOG_DIR/keycloak.log"
    else
        echo "Failed to start Keycloak. Check logs at $LOG_DIR/keycloak.log for details."
    fi
else
    echo "Keycloak is already running."
fi
