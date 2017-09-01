#!/usr/bin/env node

// Script to generate variations of image based on Ruby and Node version

const fs = require('fs');
const path = require('path');

const template = fs.readFileSync(path.join(__dirname, '.dockerfile-template'), {encoding: 'utf8'});

const NODE_VERSIONS = [
  '0.10',
  '0.12',
  '4.x',
  '6.x',
  '8.x'
];

const RUBY_VERSIONS = [
  '2.2.7',
  '2.3.4',
  '2.4.1'
];

NODE_VERSIONS.forEach((node_version) => {
  RUBY_VERSIONS.forEach((ruby_version) => {
    const ruby_minor = ruby_version.slice(0,ruby_version.lastIndexOf('.'));
    const dockerfile_content = template.replace('##NODE_VERSION##', node_version)
                                       .replace('##RUBY_MINOR_VERSION##', ruby_minor)
                                       .replace('##RUBY_VERSION##', ruby_version);
    const dockerfile_path = path.join(`node-${node_version.replace('.x', '')}`, `Dockerfile-ruby-${ruby_minor}`);
    console.log(`Writing Dockerfile to ${dockerfile_path}`);
    fs.writeFileSync(dockerfile_path, dockerfile_content);
  });
});
