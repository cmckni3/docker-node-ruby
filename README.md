# Docker image for running/building node.js and ruby projects

[![Docker Status](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/cmckni3/node-ruby) [![](https://images.microbadger.com/badges/image/cmckni3/node-ruby.svg)](https://microbadger.com/images/cmckni3/node-ruby "Get your own image badge on microbadger.com")

Debian Jessie image based on [library/buildpack-deps](https://github.com/docker-library/buildpack-deps)

## What's Included

* node.js 6.2.x
* Ruby 2.3.1

## Building the image

```sh
docker build -t cmckni3/node-ruby .
```

## Running the image

```sh
docker run -it cmckni3/node-ruby bash
```
