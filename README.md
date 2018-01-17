# How to build an image

## Without plugins

```
$ docker build -t hiromuhota/webspoon:latest .
```

## With plugins

```
$ docker build -f ./Dockerfile-base -t hiromuhota/webspoon:0.8.0-base .
$ docker build --no-cache -f ./Dockerfile-full -t hiromuhota/webspoon:latest-full .
```

# How to use the image

## Basic usage

### Without plugins

```
$ docker run -d -p 8080:8080 hiromuhota/webspoon:latest
```

### With plugins

```
$ docker run -d -p 8080:8080 hiromuhota/webspoon:latest-full
```

In either case, please access `http://ip-address:8080/spoon/spoon`.

## Advanced usage

### Java heap size

The Java heap size is configured as `-Xms1024m -Xmx2048m` by default, but can be overridden as `-Xms1024m -Xmx1920m` for example when a server has only 2GB of memory.

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx1920m" -d -p 8080:8080 hiromuhota/webspoon:latest-full
```

### User config and data persistence/share

If the configuration files should be shared among containers, add `-v kettle:/root/.kettle -v pentaho:/root/.pentaho` as

```
$ docker run -d -p 8080:8080 -v kettle:/root/.kettle -v pentaho:/root/.pentaho hiromuhota/webspoon:latest-full
```

or execute the following docker-compose command

```
$ docker-compose up -d
```

## Debug

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx2048m" -e JPDA_ADDRESS=8000 -d -p 8080:8080 -p 8000:8000 hiromuhota/webspoon:latest-full catalina.sh jpda run
```