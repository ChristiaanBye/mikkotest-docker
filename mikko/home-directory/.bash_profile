# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Show green development tag in terminal
export PS1="[\[\e[32m\]Mikko Test\[\e[0m\] \W]\\$ "

# User specific environment and startup programs
alias phpunit="php /var/www/html/vendor/bin/phpunit"
