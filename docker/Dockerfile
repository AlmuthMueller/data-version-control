FROM python:3.8

ENV HTTPS_PROXY=http://vip-proxy-ka.iosb.fraunhofer.de:3128
ENV HTTP_PROXY=http://vip-proxy-ka.iosb.fraunhofer.de:3128
ENV https_proxy=http://vip-proxy-ka.iosb.fraunhofer.de:3128
ENV http_proxy=http://vip-proxy-ka.iosb.fraunhofer.de:3128
ENV no_proxy='172.17.0.2'

RUN pip install --upgrade pip

WORKDIR /app

COPY mount-dir/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

EXPOSE  5000

