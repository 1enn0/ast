ARG FROM_IMAGE_NAME=nvcr.io/nvidia/pytorch:21.12-py3
FROM ${FROM_IMAGE_NAME}

ENV PYTHONPATH /workspace/ast
WORKDIR /workspace/ast

# install torchaudio from source
RUN git clone --recursive https://github.com/pytorch/audio /opt/pytorch/audio && \
    cd /opt/pytorch/audio && \
    git checkout v0.11.0
ADD zlib-url.patch /opt/pytorch/audio/zlib-url.patch
RUN cd /opt/pytorch/audio && \
    git apply zlib-url.patch && \
    python setup.py install

ADD requirements.txt .
RUN pip install -r requirements.txt
RUN pip install magic-wormhole

COPY . .
