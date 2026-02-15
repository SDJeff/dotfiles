# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$DOTFILES/zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ------------------------------------------------------------------------------
# Oh My Zsh Settings (zstyle)
# ------------------------------------------------------------------------------
zstyle ':omz:*' case-sensitive false
zstyle ':omz:*' hyphen-insensitive true
zstyle ':omz:*' completion-waiting-dots true
zstyle ':omz:update' frequency 7
zstyle ':omz:update' mode auto

ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="false"
HIST_STAMPS="dd.mm.yyyy"

# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------
plugins=(
  aliases alias-finder git macos npm composer node vagrant
  zsh-syntax-highlighting zsh-completions
)

# alias-finder: show matching aliases when typing long commands
zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' longer yes
zstyle ':omz:plugins:alias-finder' exact yes
zstyle ':omz:plugins:alias-finder' cheaper yes

# zsh-completions: add to fpath before compinit (which oh-my-zsh runs)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# Enable autosuggestions (custom plugin, sourced manually)
source $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ------------------------------------------------------------------------------
# Source dotfiles
# ------------------------------------------------------------------------------
[ -f "$DOTFILES/.functions" ] && source "$DOTFILES/.functions"

# Import ssh keys in keychain
ssh-add --apple-load-keychain 2>/dev/null;

# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Do not update all homebrew stuff automatically
export HOMEBREW_NO_AUTO_UPDATE=1

# ------------------------------------------------------------------------------
# Herd + NVM (NVM must load before Herd's zshrc calls nvm_find_nvmrc)
# ------------------------------------------------------------------------------
export PATH="$HOME/Library/Application Support/Herd/bin":$PATH

export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"
export HERD_PHP_81_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/81/"
export HERD_PHP_74_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/74/"

export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# ------------------------------------------------------------------------------
# Tools
# ------------------------------------------------------------------------------

# EZA completions
export FPATH="$HOME/eza/completions/zsh:$FPATH"

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# ------------------------------------------------------------------------------
# fzf + fzf-tab
# ------------------------------------------------------------------------------
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

source <(fzf --zsh)

# fzf-tab: must be loaded AFTER compinit and fzf
source $DOTFILES/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# ------------------------------------------------------------------------------
# Starship prompt (must be last)
# ------------------------------------------------------------------------------
export STARSHIP_CONFIG="$DOTFILES/.config/starship.toml"
eval "$(starship init zsh)"
