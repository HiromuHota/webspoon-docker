# How to use

## Without plugins

```
$ docker build --build-arg version=0.6.1.7 -t hiromuhota/webspoon:latest .
```

## With plugins

Please build a image <b>without</b> plugins before building another <b>with</b> plugins.
Also please make sure that PDI (CE) is extracted and the `data-integration` folder exists in the same directory.

```
$ unzip pdi-ce-6.1.0.1-196.zip
$ docker build -f ./Dockerfile-full --build-arg version=0.6.1.7 -t hiromuhota/webspoon:latest-full .
```