# How to build an image

## Without plugins

```
$ docker build --build-arg version=0.7.0.8 -t hiromuhota/webspoon:latest .
```

## With plugins

```
$ docker build -f ./Dockerfile-full --build-arg version=0.7.0.8 -t hiromuhota/webspoon:latest-full .
```

# How to use the image

## Without plugins

```
$ docker run -d -p 8080:8080 hiromuhota/webspoon:latest
```

## With plugins

```
$ docker run -d -p 8080:8080 -p 9051:9051 hiromuhota/webspoon:latest-full
```