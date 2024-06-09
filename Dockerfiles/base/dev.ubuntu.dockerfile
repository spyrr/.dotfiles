FROM ubuntu:latest

WORKDIR /root

RUN apt-get update
RUN apt-get -y install curl tmux zsh neovim git lsd npm

ENTRYPOINT ["/bin/bash"]
