# Docker image for running/building node.js and Ruby projects

[![Docker Status](https://img.shields.io/badge/docker-ready-blue.svg)](https://hub.docker.com/r/cmckni3/node-ruby)
[![Docker Pulls](https://img.shields.io/docker/pulls/cmckni3/node-ruby?label=Docker%20Hub%20Image%20Pulls)](https://hub.docker.com/r/cmckni3/node-ruby)
[![Image Size](https://img.shields.io/docker/image-size/cmckni3/node-ruby/latest)](https://hub.docker.com/r/cmckni3/node-ruby)

- Container image for running/building node.js and Ruby projects.
- Debian Bookworm image based on [library/buildpack-deps](https://github.com/docker-library/buildpack-deps)

## What's Included

### node.js and Ruby managers

* nvm
* rbenv and ruby-build

### Versions

* Recent version of node.js (latest) installed by default
* Recent version of Ruby (latest) installed by default

## Pulling the image

```sh
docker pull cmckni3/node-ruby
```

## Building the image

```sh
docker build -t cmckni3/node-ruby .
```

## Running the image

```sh
docker run -it cmckni3/node-ruby bash
```
