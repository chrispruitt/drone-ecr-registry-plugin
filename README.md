This is an extention of https://github.com/drone/drone-registry-plugin. It removes the config.yml dependency for simple ecr authentication. It creates and maintains the `config.yml` on start by accepting `DRONE_ECR_REGISTRY_URI` as an environment variable.

# Installation

Create a shared secret:

```
$ openssl rand -hex 16
bea26a2221fd8090ea38720fc445eca6
```

Configure the plugin:

```
DRONE_DEBUG=true
DRONE_SECRET=bea26a2221fd8090ea38720fc445eca6
DRONE_ECR_REGISTRY_URI=111111111111.dkr.ecr.us-east-1.amazonaws.com
```

Start the plugin:

```
docker run \
 --detach \
 --restart=always \
 -p 3000:3000 \
 -e DRONE_DEBUG=true \
 -e DRONE_SECRET=bea26a2221fd8090ea38720fc445eca6 \
 -e DRONE_ECR_REGISTRY_URI=111111111111.dkr.ecr.us-east-1.amazonaws.com \
 chrispruitt/drone-ecr-registry-plugin
```

Configure your runner to use the plugin:

```
DRONE_REGISTRY_ENDPOINT=http://plugin.address:3000
DRONE_REGISTRY_SECRET=bea26a2221fd8090ea38720fc445eca6
```
