# Install

## via curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/spyrr/.dotfiles/master/bin/install.sh)"
```

## via wget

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/spyrr/.dotfiles/master/bin/install.sh)"
```

# Dev env on Docker container
```bash
git clone https://github.com/spyrr/.dotfiles
cd .dotfiles
docker compose build
docker run -it --name dev --hostname dev dev
```
