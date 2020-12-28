#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
shopt -s extglob

HTML_SOURCE=$(realpath "$1")
HTML_OUTPUT=$(realpath "$2")

docker run --rm --mount "type=bind,source=$HTML_SOURCE,destination=/imhele/html,readonly=1" \
                --env "HTML_SOURCE=/imhele/html" \
                --mount "type=bind,source=$HTML_OUTPUT,destination=/imhele/output" \
                --env "HTML_OUTPUT=/imhele/output" \
                imhele/html-build
