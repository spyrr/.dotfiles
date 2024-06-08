# Install

## via curl

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/spyrr/.dotfiles/master/bin/install.sh)"
```

## via wget

```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/spyrr/.dotfiles/master/bin/install.sh)"
```

# Test
## Test on Ubuntu Docker Container
```bash
git clone https://github.com/spyrr/.dotfiles
cd .dotfiles
docker build -t dotfiles -f Dockerfiles/ubuntu/Dockerfile .
```
