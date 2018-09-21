###############################################################################
# 									      #
# KAMERMANPR/DOCKER-SURVEY						      #
#									      #
###############################################################################

#-- Get the geospatial rocker image --#

FROM rocker/geospatial:3.5.1

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

#-- Run shell scripts --#
# Copying bash script into /etc/cont-init.d sets it to run at startup

COPY git_config.sh /etc/cont-init.d/gitconfig
COPY rstudio_config.sh /etc/cont-init.d/theme


#-- Install extra packages --#

RUN install2.r --error --deps TRUE \
	fiftystater \
	geofacet \
	ggiraph \
	skimr \
	survey \
	srvyr 