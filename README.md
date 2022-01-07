# mirror-maker

A mirror-maker container based on [bitnami/kafka](https://hub.docker.com/r/bitnami/kafka/) and
 [srotya/docker-kafka-mirror-maker](https://github.com/rockset/mirror-maker).

### Build
This image is available from Docker hub however, if you would like to build it yourself here are the steps:

```
git clone https://github.com/0qq/kafka-mirror-maker.git
cd docker-kafka-mirror-maker
export KAFKA_VERSION=2.8.1
docker build --build-arg KAFKA_VERSION=$KAFKA_VERSION -t kafka-mirror-maker:$KAFKA_VERSION .
```

**Note: Docker is expected to be installed where you run the build**

### Environment Variables
|    Variable Name    |                   Description                |   Default |
|---------------------|----------------------------------------------|------------|
|      SOURCE         | bootstrap.servers for the source kafka       |source-cluster:9092|
|    DESTINATION      | bootstrap.servers for the destination kafka  |localhost:9092|
|     TOPICS          | Topics to mirror     | .* |

#### Docker usage
```
docker run -it -e SOURCE=from.example.com:9092 -e DESTINATION=to.example.com:9092 -e TOPICS=<TOPIC NAME> mirror-maker:latest
```

#### Docker-compose usage

See [docker-compose.yml](docker-compose.yml)

### License

Apache 2.0
