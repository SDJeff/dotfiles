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

echo 'Configure npm'
echo '-------------'
# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

# Themes and Plugins for ohmyzsh
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle # DEPRECATED was merged into brew
brew bundle --file ./Brewfile

echo 'Install some nice quicklook plugins'
echo '-----------------------------------'
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip suspicious-package


# Create a Sites directory
echo "Create a my working directories"
echo '-----------------------------------'
mkdir $HOME/Code
mkdir $HOME/Statamic
mkdir $HOME/Workspace
mkdir $HOME/Code/Sites
mkdir $HOME/Downloads/Screenshots

echo '++++++++++++++++++++++++++++++'
echo 'Some optional tidbits'

echo '1. Don't forget unregister the apps at your old machine'
echo '2. Set some sensible os x defaults by running: $HOME/.dotfiles/macos/set-defaults.sh'
echo '3. Transfer all your licences for bought apps'
ech0 '4. IMPORTANT: Transfer your SSH Keys to your new machine'

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
