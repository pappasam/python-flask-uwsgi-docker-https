#######################################################################

FROM python:3.6.5-alpine as base

ARG USERNAME=sroeca
ARG USERHOME=/home/$USERNAME

# RUN apk update

RUN apk add --no-cache \
      linux-headers \
      g++
      # openssl \
      # openssl-dev \
      # ca-certificates

RUN addgroup $USERNAME
RUN adduser -u 1000 -SH -G $USERNAME $USERNAME
RUN mkdir -p $USERHOME
RUN chown -R $USERNAME:$USERNAME $USERHOME

WORKDIR $USERHOME

# COPY instance/ instance/
# RUN cp instance/localhost.crt /usr/local/share/ca-certificates/
# RUN update-ca-certificates

COPY requirements.txt .
COPY main.py .
COPY uwsgi.ini .

RUN pip install -r requirements.txt

USER $USERNAME

#######################################################################

FROM base as hello-world

ENTRYPOINT [ "uwsgi", "--ini", "uwsgi.ini", "--callable", "APP_HELLO_WORLD"]

#######################################################################

FROM base as rich-man

ENTRYPOINT [ "uwsgi", "--ini", "uwsgi.ini", "--callable", "APP_RICH_MAN"]

#######################################################################

# FROM nginx:1.14-alpine-perl


