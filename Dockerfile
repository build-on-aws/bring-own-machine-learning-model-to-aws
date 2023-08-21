#Download an open source TensorFlow Docker image
FROM ubuntu:18.04

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         wget \
         python3-pip \
         python3-setuptools \
         nginx \
         ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
# Install sagemaker-training toolkit that contains the common functionality necessary to create a container compatible with SageMaker and the Python SDK.
#RUN pip install sagemaker-training
RUN pip --no-cache-dir install numpy==1.16.2 scipy==1.2.1 scikit-learn==0.20.2 pandas flask gunicorn

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE

# Copies the training code inside the container
COPY train.py /opt/ml/code/train.py

WORKDIR /opt/ml/code/