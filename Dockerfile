ARG WATTSI_VERSION
FROM whatwg/wattsi:${WATTSI_VERSION} as wattsi-stage

FROM debian:stable-slim
RUN apt-get update && \
    apt-get install -y ca-certificates curl git unzip python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

COPY --from=wattsi-stage /whatwg/wattsi/bin/wattsi /bin/wattsi

RUN pip3 install bs-highlighter

COPY . /whatwg/html-build/

ENV SKIP_BUILD_UPDATE_CHECK true
ENTRYPOINT ["bash", "/whatwg/html-build/build.sh"]
