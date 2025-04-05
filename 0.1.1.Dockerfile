ARG BASE_IMAGE=ubuntu:24.04

FROM ${BASE_IMAGE}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN mkdir -p /opt/static-jinja-plus

WORKDIR /opt/static-jinja-plus

ADD --checksum=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz /tmp/app.tar.gz

RUN tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/static-jinja-plus && rm /tmp/app.tar.gz

RUN python3 -m venv venv \
    && ./venv/bin/pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["./venv/bin/python3", "main.py"]

