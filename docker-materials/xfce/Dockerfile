FROM base
MAINTAINER Damien Duportal <damien.duportal@gmail.com>

RUN apk add --update --no-cache --upgrade xfce4 dbus dbus-x11

USER dev

ENTRYPOINT ["/usr/bin/startxfce4"]
