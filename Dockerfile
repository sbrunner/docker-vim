FROM debian:13.7

RUN --mount=type=cache,target=/var/lib/apt/lists \
    --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes --no-install-recommends \
        cron docker.io fdupes git iputils-ping less net-tools procps python-is-python3 \
        python3-pip python3-venv rsync screen tree vim \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install '--only-binary=:all:' --upgrade pip \
    && /opt/venv/bin/pip install '--only-binary=:all:' pipenv==2022.3.28 poetry==2.5.1

RUN echo 'set hlsearch  " Highlight search' > /root/.vimrc \
    && echo 'set wildmode=list:longest  " Completion menu' >> /root/.vimrc \
    && echo 'set term=xterm-256color  " Make home and end working' >> /root/.vimrc \
    && echo 'syntax on' >> /root/.vimrc

ENV TERM=linux \
    LANG=C.UTF-8 \
    PATH="/opt/venv/bin:$PATH"

WORKDIR /src
