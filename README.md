# How to build an image

## Without plugins

```
$ docker build --build-arg version=0.7.1.11 -t hiromuhota/webspoon:latest .
```

## With plugins

```
$ docker build -f ./Dockerfile-base -t hiromuhota/webspoon:0.7.1-base .
$ docker build -f ./Dockerfile-full --build-arg version=0.7.1.11 -t hiromuhota/webspoon:latest-full .
```

# How to use the image

## Basic usage

The recommended Java heap size is `-Xms1024m -Xmx2048m`, but can be `-Xms1024m -Xmx1920m` when a server has only 2GB of memory.

### Without plugins

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx2048m" -d -p 8080:8080 hiromuhota/webspoon:latest
```

### With plugins

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx2048m" -d -p 8080:8080 -p 9051:9051 hiromuhota/webspoon:latest-full
```

## Advanced usage

If the configuration files should be shared among containers, add `-v kettle:/root/.kettle -v pentaho:/root/.pentaho` as

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx2048m" -d -p 8080:8080 -p 9051:9051 -v kettle:/root/.kettle -v pentaho:/root/.pentaho hiromuhota/webspoon:latest-full
```

or execute the following docker-compose command

```
$ docker-compose up -d
```