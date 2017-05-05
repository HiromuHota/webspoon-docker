# How to build an image

## Without plugins

```
$ docker build --build-arg version=0.7.0.9 -t hiromuhota/webspoon:latest .
```

## With plugins

```
$ docker build -f ./Dockerfile-base -t hiromuhota/webspoon:0.7.0-base .
$ docker build -f ./Dockerfile-full --build-arg version=0.7.0.9 -t hiromuhota/webspoon:latest-full .
```

# How to use the image

The recommended Java heap size is `-Xms1024m -Xmx2048m`.

## Without plugins

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx2048m" -d -p 8080:8080 hiromuhota/webspoon:latest
```

## With plugins

```
$ docker run -e JAVA_OPTS="-Xms1024m -Xmx2048m" -d -p 8080:8080 -p 9051:9051 hiromuhota/webspoon:latest-full
```
