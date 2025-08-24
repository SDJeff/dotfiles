# Universal Helper for me
alias c="clear" # Typing the whole word is annoying
alias h="cd ~/" # Go home
alias ce="clear && exit"
alias hostfile="sudo nano /etc/hosts"

# Fast open
alias o="open ."

# List all files colorized in long format
alias l="ls -lAFh"
# List only directories
alias lsd="ls -lF | grep --color=never '^d'"
# List with EZA Long format
alias ll="eza -l -h -o -a --time-style=+'%Y-%m-%d %H:%M' --group-directories-first"

# Size of folder
alias sizefolder='du -d 1 -h'
# Home-Ordner checken
alias sizehome='ncdu ~'
# Downloads checken
alias sizedownloads='ncdu ~/Downloads'
# Root ohne externe Mounts
alias sizeroot='sudo ncdu -x /'
# Library-Cache durchstöbern (oft groß bei macOS)
alias sizelibcache='ncdu ~/Library/Caches'
# Schnell zur größten Datei springen
alias sizebiggest='ncdu -q /'

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias code='cd ~/Code'
alias sites='cd ~/Code/Sites'
alias cms='cd ~/Code/Statamic'
alias work='cd ~/Code/Workspace'
alias projects='cd ~/Projects'

# Tool replacements
alias cat=bat

# PhpStorm
alias pstorm='open -a /Applications/PhpStorm.app "`pwd`"'
# VSCode
alias vscode='open -a "/Applications/Visual Studio Code.app" "`pwd`"'

alias camera='sudo killall VDCAssistant && sudo killall AppleCameraAssistant;'

alias spacedock="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias myip="curl http://ipecho.net/plain; echo"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
#alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Ray Spatie
alias rray='comp require spatie/laravel-ray'
alias cr='ray -C' # clear ray

# Lock the screen
#alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
#alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias afk="pmset displaysleepnow"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Enable aliases to be sudo’ed
alias sudo='sudo '

#Reload Terminal/Shell
alias reload="exec ${SHELL} -l"
alias reloadshell="source $HOME/.zshrc"

# SSH
alias sshkey="cat ~/.ssh/id_rsa.pub | tee >(pbcopy)"
alias sshconfig="nano ~/.ssh/config"
alias copykey='command cat ~/.ssh/id_rsa.pub | pbcopy'
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias key2srv="ssh-copy-id -i /Users/sascha/.ssh/id_rsa "

# SQL Server
# alias mssql="docker run -e ACCEPT_EULA=Y -e SA_PASSWORD=geheim.1234 -p 1433:1433 mcr.microsoft.com/mssql/server:2017-latest"

#Python
alias python=python3
