FROM python:3.11.2-alpine

ARG APP
ARG HOST
ARG PORT

ENV SRV_PATH=/srv
ENV REPO=D0x-K1t-v2

ENV APP="run.py"
ENV HOST="0.0.0.0"
ENV PORT="5000"

WORKDIR $SRV_PATH

# ENTRYPOINT [ "flask" ]
# CMD [ "--app", $APP, "run", "--host", $HOST, "--port", $PORT ]
ENTRYPOINT [ "sh", "start.sh" ]

RUN apk update && apk add git

# git the repo
RUN git clone https://github.com/anoduck/D0x-K1t-v2

WORKDIR $SRV_PATH/$REPO

ADD start.sh .

# Installed required stuff
RUN python -m pip install -r requirements.txt
