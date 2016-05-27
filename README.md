# Docker image for running/building node.js and ruby projects

[![Docker Status](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/cmckni3/node-ruby)
[![Image Layers](https://badge.imagelayers.io/cmckni3/node-ruby.svg)](https://imagelayers.io/?images=cmckni3/node-ruby:latest 'Get your own badge on imagelayers.io')

Debian Jessie image based on [library/buildpack-deps](https://github.com/docker-library/buildpack-deps)

## What's Included

* node.js 0.10.x
* Ruby 2.2.5

## Building the image

```sh
docker build -t cmckni3/node-ruby .
```

## Running the image

```sh
docker run -it cmckni3/node-ruby bash
```
