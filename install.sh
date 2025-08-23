#!/usr/bin/env bash

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

#------------------------------------------------------------------------------
# IS THIS STILL NECESSARY WITH HERD PRO
# ------------------------------------------------------------------------------
# Install Composer -> Make sure PHP is installed before composer is loading
# curl -sS https://getcomposer.org/installer | php
# mv composer.phar /usr/local/bin/composer

# Install global Composer packages
#/usr/local/bin/composer global require laravel/installer
#------------------------------------------------------------------------------
#
# Create a Sites directory
# This is an default directory for OS X user accounts but doesn't comes pre-installed
mkdir $HOME/Code
mkdir $HOME/Code/Sites
mkdir $HOME/Downloads/Screenshots

# Set OS X preferences
# We will run this last because this will reload the shell
source .macos
