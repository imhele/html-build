# HTML Standard CI Build

This directory contains the infrastructure for building and running a Docker container, [imhele/html-build](https://hub.docker.com/r/imhele/html-build), which performs a "full" build of the HTML Standard, producing artifacts ready for deployment.

The relevant entrypoints are:

- `docker-build.sh` will build the Docker container
- `docker-run.sh $INPUT $OUTPUT` will run the Docker container to do such a full build.
  - `$INPUT` should contain a checkout of the [imhele/html](https://github.com/imhele/html) repository
  - `$OUTPUT` should be an empty directory
