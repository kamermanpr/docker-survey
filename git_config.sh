#!/usr/bin/with-contenv bash

# Setup git user information
GIT_USER=${GIT_USER:=none}
GIT_EMAIL=${GIT_EMAIL:=none}

if [ "$GIT_USER" != none ]; then
	echo -e "[user]\n\tname=$GIT_USER\n\temail=$GIT_EMAIL" > /home/rstudio/.gitconfig
	git config --global credential.helper cache
fi
