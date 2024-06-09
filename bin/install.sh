#!/bin/sh
# original script: https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh

# STEP 1: initialize
set -e

#CHSH=$(CHSH:-yes)
CHSH=yes

apt-get install -y git neovim tmux zsh lsd
command_exists() {
	command -v "$@" > /dev/null 2>&1
}

umask g-w, o-w
command_exists git || {
	error "git is not installed"
	exit 1
}

command_exists curl || {
	error "curl is not installed"
	exit 1
}

git clone --depth=1 https://github.com/spyrr/.dotfiles ~/.dotfiles ||  {
	error "Failed to clone dotfiles"
	exit 1
}

# STEP 2: install oh-my-zsh and add custom zsh env
sh -c "CHSH=${CHSH} $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || {
	error "Failed to install oh-my-zsh"
	exit 2
}

# STEP 3: install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || {
	error "Failed to clone powerlevel10k"
	exit 3
}
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
[ -f ~/.zshrc ] && echo "\nsource .dotfiles/zshrc" >> ~/.zshrc || {
	error "zshrc does not exist"
	exit 3
}

# STEP 4: Install oh-my-tmux
git clone https://github.com/gpakosz/.tmux.git || {
	error "Failed to clone oh my tmux"
	exitr 4
}
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# STEP 5: Link vimrc
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

command_exists nvim && {
	mkdir ~/.config
	ln -s ~/.dotfiles/nvim ~/.config/nvim

	nvim -E -s -c "source ~/.config/nvim/init.vim" -c "PlugInstall" -c "qa"
} || {
	ln -s ~/.dotfiles/vimrc ~/.vimrc
	vim -E -s -c "source ~/.vimrc" -c "PlugInstall" -c "qa"
}
