#!/bin/sh

if [ -z "$DRONE_ECR_REGISTRY_URI" ]
then
    echo "Missing required environment variable: DRONE_ECR_REGISTRY_URI"
    exit 1
fi

# create config.yml
echo "- address: $DRONE_ECR_REGISTRY_URI" > $DRONE_CONFIG_FILE

/bin/drone-registry-plugin

eval $@
