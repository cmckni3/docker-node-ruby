# Docker image for running/building node.js and ruby projects

[![Docker Status](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/cmckni3/node-ruby) [![](https://images.microbadger.com/badges/image/cmckni3/node-ruby.svg)](https://microbadger.com/images/cmckni3/node-ruby "Get your own image badge on microbadger.com")

Debian Jessie image based on [library/buildpack-deps](https://github.com/docker-library/buildpack-deps)

## What's Included

* node.js 0.10, 0.12, 4, 6, 8
* Ruby 2.2, 2.3, 2.4

## Building the image

```sh
docker build -t cmckni3/node-ruby .
```

## Running the image

```sh
docker run -it cmckni3/node-ruby bash
```
