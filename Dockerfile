FROM python:3.11.2-alpine

ENV SRV_PATH=/srv
ENV REPO=D0x-K1t-v2

WORKDIR $SRV_PATH

ENTRYPOINT [ "python", "run.py" ]

#Update Alpine
RUN apk update && apk upgrade

# Install required
RUN apk add git

# git the repo
RUN git clone https://github.com/anoduck/D0x-K1t-v2

WORKDIR $SRV_PATH/$REPO

# For Debugging of container
RUN echo $(pwd)

RUN ls -l

# Installed required stuff
RUN python -m pip install -r requirements.txt
