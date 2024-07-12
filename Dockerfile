FROM docker.io/python:3.12-alpine

RUN apk add --no-cache bind webhook build-base libffi-dev

RUN pip install --upgrade pip \
    && pip install ansible pynetbox

COPY ansible /ansible

WORKDIR /ansible

CMD ["webhook", "-hooks", "/ansible/hooks.config.yaml", "-verbose"]
