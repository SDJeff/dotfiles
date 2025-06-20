# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="herd composer"
alias php="herd php"
# alias composer="php -d memory_limit=-1 /usr/local/bin/composer"
alias co="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias cg="composer global"
alias cgu="composer global update"
alias ray="valet composer require spatie/ray"
alias phpunit="vendor/bin/phpunit"
alias phpunitw="phpunit-watcher watch"
alias herdtest="herd coverage ./vendor/bin/pest --colors=always --parallel --coverage --exactly=100"

# Get version of installed Composer package
compv() {
  if [[ $1 == *"/"* ]]; then
    composer show $1 | grep 'versions' | grep -o -E '\*\ .+' | cut -d' ' -f2 | cut -d',' -f1;
  else
    composer info | grep $1
  fi
}


# ------------------------------------------------------------------------------
# Testing (Pest or PHPUnit, depending on what's available)
# ------------------------------------------------------------------------------

t() {
    if [ -f "./vendor/bin/pest" ]; then
        herd php ./vendor/bin/pest $@
    elif [ -n "./vendor/bin/phpunit" ]; then
        herd php ./vendor/bin/phpunit $@
    fi
}

alias p="./vendor/bin/pest" # runs pest
alias pc="p --type-coverage" # runs a coverage check fro pest
alias stan="vendor/bin/phpstan analyse --memory-limit=2G" # runs phpstan
alias tf="t --filter"
