###############################################################################
# 									      #
# KAMERMANPR/DOCKER-SURVEY						      #
#									      #
###############################################################################

#-- Get the geospatial rocker image --#

FROM rocker/geospatial:3.6.0

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

#-- Install extra packages --#

RUN Rscript -e "install.packages(c('fiftystater', 'geofacet', 'ggiraph', 'skimr', 'survey', 'srvyr'))"
