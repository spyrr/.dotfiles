FROM ubuntu:latest

WORKDIR /root

RUN apt-get update
RUN apt-get -y install curl tmux zsh neovim git lsd

COPY ./bin/install.sh /root/install.sh
RUN chmod 755 /root/install.sh
RUN ./install.sh
RUN rm /root/install.sh

ENTRYPOINT ["/bin/bash"]
