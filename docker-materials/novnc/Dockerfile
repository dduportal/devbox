FROM base
MAINTAINER Damien Duportal <damien.duportal@gmail.com>

ENV NOVNC_DIR=/app/noVNC

RUN apk add --update --no-cache git \
  && git clone https://github.com/kanaka/noVNC.git "${NOVNC_DIR}" \
	&& git clone https://github.com/kanaka/websockify "${NOVNC_DIR}/utils/websockify" \
	&& rm -rf "${NOVNC_DIR}/.git" \
	&& rm -rf "${NOVNC_DIR}/utils/websockify/.git" \
  && chmod a+x "${NOVNC_DIR}/utils/launch.sh" \
	&& apk del -r git

RUN apk add --update --no-cache python

# Modify the launch script 'ps -p'
RUN sed -i -- "s/ps -p/ps -o pid | grep/g" "${NOVNC_DIR}/utils/launch.sh"

USER dev

EXPOSE 9000

ENTRYPOINT ["sh","/app/noVNC/utils/launch.sh","--listen","9000"]
CMD ["--vnc","localhost:5900"]
