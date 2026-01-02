# How to build this config server image without compose
## Create a .env file
```
CONFIG_SERVER_URI=https://github.com/your-github-username/your-github-repo
CONFIG_SERVER_USERNAME=your-github-username
CONFIG_SERVER_PASSWORD=your-github-token-classic-for-repo-access
CONFIG_PORT=8888
SPRING_PROFILES_ACTIVE=default
```

## Build this image
```bash
docker build \
  --build-arg CONFIG_PORT=$(grep CONFIG_PORT .env | cut -d '=' -f2) \
  --build-arg CONFIG_SERVER_URI=$(grep CONFIG_SERVER_URI .env | cut -d '=' -f2) \
  --build-arg CONFIG_SERVER_USERNAME=$(grep CONFIG_SERVER_USERNAME .env | cut -d '=' -f2) \
  --build-arg CONFIG_SERVER_PASSWORD=$(grep CONFIG_SERVER_PASSWORD .env | cut -d '=' -f2) \
  --build-arg SPRING_PROFILES_ACTIVE=$(grep SPRING_PROFILES_ACTIVE .env | cut -d '=' -f2) \
  -t boleiros-config-server:1.0 .
```

## Run this container
```bash
docker run -d \
  --name boleiros-config-server \
  --env-file .env \
  -p 8888:8888 \
  boleiros-config-server:1.0

```