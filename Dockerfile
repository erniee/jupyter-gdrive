FROM dddlab/python-notebook:v20200331-df7ed42-94fdd01b492f

LABEL maintainer="Ernesto Espinosa <eespinosa@ucsb.edu>"

RUN pip install nbzip

USER root

RUN jupyter serverextension enable --py nbzip --sys-prefix && \
\
    jupyter nbextension install --py nbzip && \
\
    jupyter nbextension enable --py nbzip


RUN apt-get update \
    && apt-get install fuse \
    && apt-get clean \
    && curl https://rclone.org/install.sh | sudo bash
