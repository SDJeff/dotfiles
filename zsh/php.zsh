# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
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

# PHP Switcher #USING Herd now
# alias switch-php8="brew unlink php@7.4 && brew link --overwrite --force php"
# alias switch-php74="brew unlink php && brew link --overwrite --force php@7.4"

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
        valet php ./vendor/bin/pest $@
    elif [ -n "./vendor/bin/phpunit" ]; then
        valet php ./vendor/bin/phpunit $@
    fi
}

alias tf="t --filter"