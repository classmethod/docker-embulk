FROM openjdk:8-alpine

ENV EMBULK_VERSION 0.9.7

# Install libc6-compat for Embulk Plugins to use JNI
# cf : https://github.com/jruby/jruby/wiki/JRuby-on-Alpine-Linux
RUN apk --update add --virtual build-dependencies \
    curl \
    && apk --update add libc6-compat \
    && mkdir /embulk \
    && curl -o  /embulk/embulk -L "https://dl.embulk.org/embulk-$EMBULK_VERSION.jar" \
    && chmod +x /embulk/embulk \
    && apk del build-dependencies \
    && adduser -D embulk \
    && chown -R embulk /embulk

USER embulk

COPY docker-entrypoint.sh /embulk/entrypoint.sh

WORKDIR /embulk

ENTRYPOINT ["/embulk/entrypoint.sh"]
