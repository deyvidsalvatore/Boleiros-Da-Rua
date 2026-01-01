# How to build this Database without Compose
## 1. Create a .env file in this folder
```env
PG_USER=admin
PG_PASS=password
```
## 2. Build the image
```bash
docker build \
  --build-arg PG_USER=$(grep PG_USER .env | cut -d '=' -f2) \
  --build-arg PG_PASS=$(grep PG_PASS .env | cut -d '=' -f2) \
  -t boleiros-postgres-custom:1.0 .
```

## 3. Run the container
```bash
docker run -d \
  --name boleiros-db-instance \
  --env-file .env \
  -p 5555:5432 \
  boleiros-postgres-custom:1.0
```