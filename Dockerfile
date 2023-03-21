FROM python:3.11.2-alpine

WORKDIR /srv

ENTRYPOINT [ "python3 run.py" ]

#Update Alpine
RUN apk upgrade && apk upgrade

# Install required
RUN apk update && apk add wget \
bash \
bash-completion \
git

# git the repo
RUN git clone https://github.com/anoduck/D0x-K1t-v2 && cd D0x-K1t-v2

# Installed required stuff
RUN python3 -m pip install -r requirements.txt

