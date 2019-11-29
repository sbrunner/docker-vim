FROM debian

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends \
        git net-tools iputils-ping screen vim vim-editorconfig vim-addon-manager tree && \
    apt-get clean && \
    rm --force --recursive /var/lib/apt/lists/*

RUN vim-addon-manager --system-wide install editorconfig && \
    echo 'set hlsearch  " Highlight search' > /root/.vimrc && \
    echo 'set wildmode=list:longest  " Completion menu' >> /root/.vimrc && \
    echo 'set term=xterm-256color  " Make home and end working' >> /root/.vimrc && \
    echo 'syntax on' >> /root/.vimrc

ENV TERM=linux \
    LANG=C.UTF-8

WORKDIR /src
