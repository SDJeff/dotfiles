#!/bin/sh

echo "Setting up your Mac..."

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add global gitignore
ln -s $HOME/.dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink starship config
mkdir -p $HOME/.config
ln -sf $HOME/.dotfiles/.config/starship.toml $HOME/.config/starship.toml

echo 'Configure npm'
echo '-------------'
# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

# ZSH Plugins
echo 'Installing zsh plugins...'
echo '-------------------------'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file ./Brewfile

echo 'Install some nice quicklook plugins'
echo '-----------------------------------'
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip suspicious-package

# Create working directories
echo "Create my working directories"
echo '-----------------------------------'
mkdir -p $HOME/Code
mkdir -p $HOME/Statamic
mkdir -p $HOME/Workspace
mkdir -p $HOME/Code/Sites
mkdir -p $HOME/Downloads/Screenshots

echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo "1. Do NOT forget unregister the apps at your old machine"
echo "2. Set some sensible os x defaults by running: $HOME/.dotfiles/macos/set-defaults.sh"
echo "3. Transfer all your licences for bought apps"
echo "4. IMPORTANT: Transfer your SSH Keys to your new machine"
echo "++++++++++++++++++++++++++++++"
echo "++++++++++++++++++++++++++++++"
