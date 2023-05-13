# Universal Helper for me
alias c="clear" # Typing the whole word is annoying
alias h="cd ~/" # Go home
alias ce="clear && exit"
alias hostfile="sudo nano /etc/hosts"

# Fast open
alias o="open ."

# List all files colorized in long format
alias l="ls -laF"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias code='cd ~/Code'
alias sites='cd ~/Code/Sites'
alias work='cd ~/Code/Workspace'
alias tramelo='cd ~/Code/tramelo-app && sail up -d'

# Laravel
alias a="php artisan"
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
alias seed="php artisan db:seed"
alias serve="php artisan serve"
alias mfs='php artisan migrate:fresh --seed'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"
alias co="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias phpunit="vendor/bin/phpunit"
alias phpunitw="phpunit-watcher watch"
# PHP Switcher
alias switch-php8="brew unlink php@7.4 && brew link --overwrite --force php"
alias switch-php74="brew unlink php && brew link --overwrite --force php@7.4"

# Vagrant
alias v='vagrant version && vagrant global-status'
alias vst='vagrant status'
alias vup='vagrant up'
alias vdo='vagrant halt'
alias vssh='vagrant ssh'
alias vkill='vagrant destroy'
alias gvssh='cd ~/Homestead && vssh'

# Tool replacements
alias cat=bat

# Git
alias gc="git checkout"
alias gpo="git push origin"
alias gm="git merge"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah='git reset --hard;git clean -df'
alias pull="git pull"
alias push="git push"
alias wip="commit wip"

function acp() {
  git add .
  git commit -m "$1"
  git push
}

# PhpStorm
alias pstorm='open -a /Applications/PhpStorm.app "`pwd`"'
# VSCode
alias vscode='open -a "/Applications/Visual Studio Code.app" "`pwd`"'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias myip="curl http://ipecho.net/plain; echo"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
#alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
#alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias afk="pmset displaysleepnow"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Enable aliases to be sudo’ed
alias sudo='sudo '

#Reload Terminal/Shell
alias reload="exec ${SHELL} -l"
alias reloadshell="source $HOME/.zshrc"

# NPM and YARN
alias ni="npm install"
alias nid="npm install && npm run dev"
alias w="npm run watch"
alias yw="yarn watch"
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# SSH
alias sshkey="cat ~/.ssh/id_rsa.pub | tee >(pbcopy)"
alias sshconfig="nano ~/.ssh/config"
alias copykey='command cat ~/.ssh/id_rsa.pub | pbcopy'
alias key2srv="ssh-copy-id -i /Users/sascha/.ssh/id_rsa "
