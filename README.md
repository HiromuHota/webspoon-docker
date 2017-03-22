# How to build an image

## Without plugins

```
$ docker build --build-arg version=0.7.0.8 -t hiromuhota/webspoon:latest .
```

## With plugins

Please build a image <b>without</b> plugins before building another <b>with</b> plugins.
Also please make sure that PDI (CE) is extracted and the `data-integration` folder exists in the same directory.

```
$ unzip pdi-ce-7.0.0.0-25.zip
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