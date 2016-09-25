FROM base
MAINTAINER Damien Duportal <damien.duportal@gmail.com>

RUN apk add --update --upgrade --no-cache xvfb

# We use shell version of CMD to interpolate env var at runtime
CMD Xvfb :0 -ac -listen tcp -screen 0 ${DISPLAY_WIDTH}x${DISPLAY_HEIGHT}x24 \
  +extension RANDR ${DISPLAY}
