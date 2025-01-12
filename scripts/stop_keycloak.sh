#!/bin/bash
# Find the Keycloak process and terminate it
KEYCLOAK_PID=$(pgrep -f "keycloak.*org.jboss")
if [ -n "$KEYCLOAK_PID" ]; then
    echo "Stopping Keycloak..."
    kill -15 $KEYCLOAK_PID
    sleep 5
    if pgrep -f "keycloak.*org.jboss" > /dev/null; then
        echo "Forcing Keycloak to stop..."
        kill -9 $KEYCLOAK_PID
    fi
else
    echo "Keycloak is not running."
fi
