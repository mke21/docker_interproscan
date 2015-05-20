# docker_interproscan
## Introduction
Docker for running interproscan (https://code.google.com/p/interproscan/wiki/Introduction).
Because installing Interproscan is a pain, I created this docker file, based on Ubuntu 12.04

## Usage
Example:
```
docker run --rm -i -t -v `pwd`:/data marcel/interproscan ./interproscan.sh -i /data/myfasta.fa -d /data
```

## Warning
Docker image is quite larege >10 Gb.
Settings are all standard.
