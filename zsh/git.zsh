# ------------------------------------------------------------------------------
# GIT
# ------------------------------------------------------------------------------
alias gc="git checkout"
alias gpo="git push origin"
alias gm="git merge"
alias gl="git log --oneline --decorate --color"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias diff="git diff"
alias force="git push --force-with-lease"
alias nuke="git clean -df && git reset --hard"
alias nah='git reset --hard;git clean -df'
alias pull="git pull"
alias push="git push"
alias wip="commit wip"

function acp() {
  git add .
  git commit -m "$1"
  git push
}