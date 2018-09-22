#!/usr/bin/with-contenv bash

## Setup Rstudio default theme
THEME=${THEME:=none}

if [ "$THEME" != none ]; then
	mkdir -p /home/rstudio/.rstudio/monitored/user-settings
	echo "uiPrefs={\"theme\" : \"$THEME\"}" > \
	/home/rstudio/.rstudio/monitored/user-settings/user-settings
	chown -R rstudio /home/rstudio
fi
