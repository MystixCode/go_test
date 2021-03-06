# go_test
This is a go http server printing hello world and a mongo db. \
Setup with docker and docker-compose, with dev and prod environments.

<img src="/img/docker1.png" width="100%" height="100%">

Dev: http://localhost:8081/ \
Prod: http://localhost:8080/

## Run the project:

```shell
cd go_test
```

### WITH DOCKER COMPOSE

#### Dev Environment

```shell
docker-compose -p go_test_dev -f docker-compose-dev.yml up -d
```

#### Prod Environment

```shell
docker-compose -p go_test_prod -f docker-compose-prod.yml build
docker-compose -p go_test_prod -f docker-compose-prod.yml up -d
```

### WITHOUT DOCKER COMPOSE

#### Dev Environment
Todo:put that into a script

```shell
docker network create go_test_dev_net

docker run --network go_test_dev_net --name go_test_dev_db -d -v "go_test_dev_volume:/data/db" -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=example mongo

docker run --network go_test_dev_net --name go_test_dev -dp 8081:8080 -w /app -v "$(pwd):/app" golang:1.18 sh -c "go mod download && go run main.go"
```

#### Prod Environment
Todo:put that into a script

```shell
docker build -t go_test_prod .

docker network create go_test_prod_net

docker run --network go_test_prod_net --name go_test_prod_db -d -v "go_test_prod_volume:/data/db" -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=example mongo

docker run --network go_test_prod_net --name go_test_prod -dp 8080:8080 go_test_prod
```

## Clean up
Attention this deletes all db data!

```shell
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker network prune && docker volume prune && docker image prune -a
```
