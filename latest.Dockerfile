ARG BASE_IMAGE=ubuntu:24.04

FROM ${BASE_IMAGE}

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    jq \
    ca-certificates \
    python3 \
    python3-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN REPO_URL="https://api.github.com/repos/MrDave/StaticJinjaPlus/tags" \
    && LATEST_TAG=$(curl -s $REPO_URL | jq -r ".[0].name") \
    && echo "Downloading tag: $LATEST_TAG" \
    && curl -L -o /tmp/app.tar.gz "https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/$LATEST_TAG.tar.gz" \
    && mkdir -p /opt/static-jinja-plus \
    && tar xzf /tmp/app.tar.gz --strip-components=1 -C /opt/static-jinja-plus \
    && rm /tmp/app.tar.gz \
    && apt-get purge -y curl jq \
    && apt-get autoremove -y

WORKDIR /opt/static-jinja-plus

RUN python3 -m venv venv \
    && ./venv/bin/pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["./venv/bin/python3", "main.py"]
