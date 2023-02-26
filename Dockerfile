FROM debian:11

RUN --mount=type=cache,target=/var/lib/apt/lists \
    --mount=type=cache,target=/var/cache,sharing=locked \
    --mount=type=cache,target=/root/.cache \
    apt-get update \
    && apt-get upgrade --yes \
    && apt-get install --yes --no-install-recommends \
        git net-tools iputils-ping screen vim vim-editorconfig vim-addon-manager tree python3-pip python-is-python3 \
        cron fdupes docker.io procps less rsync procps \
    && pip install pipenv==2022.3.28 poetry

RUN vim-addon-manager --system-wide install editorconfig \
    && echo 'set hlsearch  " Highlight search' > /root/.vimrc \
    && echo 'set wildmode=list:longest  " Completion menu' >> /root/.vimrc \
    && echo 'set term=xterm-256color  " Make home and end working' >> /root/.vimrc \
    && echo 'syntax on' >> /root/.vimrc

ENV TERM=linux \
    LANG=C.UTF-8

WORKDIR /src
