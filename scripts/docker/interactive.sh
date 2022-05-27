#!/bin/bash

docker run \
    --gpus=all \
    --ipc=host \
    --rm \
    -v $PWD"/egs/esc50/data":/workspace/ast/egs/esc50/data \
    -v $PWD"/egs/esc50/exp":/workspace/ast/egs/esc50/exp \
    -v $PWD"/pretrained_models":/workspace/ast/pretrained_models \
    -it \
    ast bash