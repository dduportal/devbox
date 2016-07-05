FROM base
MAINTAINER Damien Duportal <damien.duportal@gmail.com>

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update --no-cache --upgrade x11vnc

USER dev

# We use shell version of CMD to interpolate env var at runtime
CMD x11vnc -display ${DISPLAY} -reopen -forever -loop -nopw -noshm -ncache
