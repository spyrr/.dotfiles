FROM dev-base:latest

WORKDIR /root

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/spyrr/.dotfiles/master/bin/install.sh)"

ENTRYPOINT ["/usr/bin/zsh"]
