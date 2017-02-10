# How to use

```
$ docker build --build-arg version=0.6.1.6 -t hiromuhota/webspoon:latest .
```

## With system and plugins folders

```
$ unzip pdi-ce-6.1.0.1-196.zip
$ docker build -f ./Dockerfile-full --build-arg version=0.6.1.6 -t hiromuhota/webspoon:latest-full .
```
