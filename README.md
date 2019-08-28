# Simple NGINX
Simple NGINX is a fairly simple, static website running on NGINX to demonstrating NGINX in a Docker container.

## Building from Scratch
Simple NGINX is hosted in a Docker Hub repository under `arueth/simple-nginx` but you can also build it locally with the following steps:

```
$ git clone https://github.com/docker-demo/simple-nginx.git
$ cd simple-nginx
$ docker build -t simple-nginx .
```

## Running the Built Container

```
$ docker run -it -p 8080:80 simple-nginx
```

# Docker Template
This sections explains how to create a template for use with `docker template` or the Docker Desktop Application Designer

## Prerequisites
1. Create the `app-template` organization in your registry.
1. Create the `app-template/simple-nginx-db` repository in your registry.
1. Create the `app-template/simple-nginx-front-end` repository in your registry.

## Build the application template images

### Linux 
```
$ export REGISTRY_FQDN="<FQDN of registry>"
$ docker login ${REGISTRY_FQDN}

$ cd simple-nginx/template/services
$ ./stage-images.sh
```

### Windows
```
> $REGISTRY_FQDN="<FQDN of registry>"
> docker login ${REGISTRY_FQDN}

> cd .\simple-nginx\template\services
> .\stage-images.ps1
```

## Edit the library file
1. Open the `simple-nginx/template/library.yaml` file in your favorite editor.
1. Replace `<registry fqdn>` with the FQDN of your registry, it should be the same value used in the `Build the application template images` section above.
1. Add the `library.yaml` local repository to the `docker template` settings

### Linux 
1. On your computer, open `~/.docker/application-template/preferences.yaml`
1. Add the local repository as the first item in the repositories list:
```
repositories:
- name: simple-nginx
  url: file:///<path to simpel-nginx folder>/template/library.yaml
```

### Windows
1. On your computer, open `%USERPROFILE%\.docker\application-template\preferences.yaml`
1. Add the local repository as the first item in the repositories list:
```
repositories:
- name: simple-nginx
  url: file://C:/<path to simpel-nginx folder>/template/library.yaml
```
