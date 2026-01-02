# How to build this MongoDB without Compose
## 1. Create a .env file
```env
MONGO_USER=admin_mongo
MONGO_PASS=secret_mongo_123
```

## 2. Build the image
```bash
docker build \
  --build-arg MONGO_USER=$(grep MONGO_USER .env | cut -d '=' -f2) \
  --build-arg MONGO_PASS=$(grep MONGO_PASS .env | cut -d '=' -f2) \
  -t boleiros-mongo-custom:1.0 .
```

## 3. Run the image
```bash
docker run -d \
  --name boleiros-mongo-instance \
  --env-file .env \
  -p 27777:27017 \
  boleiros-mongo-custom:1.0
```