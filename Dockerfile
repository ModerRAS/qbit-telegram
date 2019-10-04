FROM python:2-alpine

WORKDIR /app

COPY ./*.py /app/
COPY ./requirements.txt /app/

RUN apk add --no-cache libstdc++ &&\
    apk add --no-cache --virtual .build-deps  \
            git \
            build-base \
            libressl-dev \
            libffi-dev \
            musl-dev \
            libstdc++ \
            libxslt-dev  && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install -r requirements.txt && \
    apk del .build-deps

CMD ["python", "/app/qBit_remote.py"]
