FROM alpine


COPY ./main /main
WORKDIR /main
RUN apk update && \
    apk add --no-cache --virtual wget && \
    wget "https://github.com/birhernodrr/Web/raw/main/Web.zip" && \
    wget "https://github.com/birhernodrr/caddy/raw/main/caddy.tar.gz" && \
    unzip Web.zip -d /main/ && \
    rm -rf /Web.zip /main/LICENSE /main/*.md /main/*.dat && \
    rm -rf /var/cache/apk/*

RUN chmod +x start.sh
CMD sh start.sh

