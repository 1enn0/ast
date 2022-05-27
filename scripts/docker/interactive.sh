#!/bin/bash

docker run \
    --gpus=all \
    --ipc=host \
    --rm \
    -v ${PWD}:/workspace/ast \
    -it \
    ast bash