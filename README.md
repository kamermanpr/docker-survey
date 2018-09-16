# docker-survey

A dockerfile to create an image of the R environment I find useful when conducting analyses on surveys with complex designs. 

----

## R environment

The image is built using the [_rocker/geospatial_](https://hub.docker.com/r/rocker/geospatial/) image. The geospatial image adds geospatial-related tools, and builds sequentially on the following images:

| Image                                                  	        | Description                            	|
|:------------------------------------------------------------------|:------------------------------------------|
| [_rocker/r-ver:3.5.1_](https://hub.docker.com/r/rocker/r-ver)   	| Base R v3.5.1 on Debian:stretch          	|
| [_rocker/rstudio_](https://hub.docker.com/r/rocker/rstudio)     	| Adds RStudio                           	|
| [_rocker/tidyverse_](https://hub.docker.com/r/rocker/tidyverse) 	| Adds tidyverse and devtool             	|
| [_rocker/verse_](https://hub.docker.com/r/rocker/verse)         	| Adds tex & publishing-related packages 	|

In addition, several R packages that I have found useful for analysing and plotting complex survey data have been added to make up the _kamermanpr/docker-survey_ image.  

These packages include:  
- _fiftystater_ (maps of the 50 US states)  
- _geofacet_ (adds geofaceting functionality to ggplot2)  
- _ggiraph_ (adds interactive geoms to ggplot2)  
- _skimr_ (generates quick tabular data summaries)  
- _survey_ (required for the analysis of complex survey designs)  
- _srvyr_ (a wrapper for _survey_ that gives _dplyr_-like functionality). 

**MRAN Snapshot date:**  
- v0.1.0 16 September 2018  

