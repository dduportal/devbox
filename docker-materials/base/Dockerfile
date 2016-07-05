FROM alpine:latest
MAINTAINER Damien Duportal <damien.duportal@gmail.com>

## Common Part
ENV USER=dev \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  LC_ALL=C.UTF-8

RUN addgroup "${USER}" \
  && adduser -h "/home/${USER}" -G "${USER}" -D -g "${USER}" -s "/bin/sh" "${USER}"
