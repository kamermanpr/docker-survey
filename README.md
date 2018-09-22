# docker-survey-R3.5.1

A dockerfile to create an image of an R environment based on R v3.5.1 that I find useful for analysing surveys with complex designs. 

----

## R environment

The image is built using the [_rocker/geospatial_](https://hub.docker.com/r/rocker/geospatial/) image. The geospatial image adds geospatial-related tools, and builds sequentially on the following images:

| Image                                                  	        | Description                            	|
|:------------------------------------------------------------------|:------------------------------------------|
| [_rocker/r-ver:3.5.1_](https://hub.docker.com/r/rocker/r-ver)   	| Base R v3.5.1 on Debian:stretch          	|
| [_rocker/rstudio_](https://hub.docker.com/r/rocker/rstudio)     	| Adds RStudio                           	|
| [_rocker/tidyverse_](https://hub.docker.com/r/rocker/tidyverse) 	| Adds tidyverse and devtool             	|
| [_rocker/verse_](https://hub.docker.com/r/rocker/verse)         	| Adds tex & publishing-related packages 	|

In addition, the image includes R packages that I find useful when analysing and plotting complex survey data.  

These packages include:  
- _fiftystater_ (maps of the 50 US states)  
- _geofacet_ (adds geofaceting functionality to ggplot2)  
- _ggiraph_ (adds interactive geoms to ggplot2)  
- _skimr_ (generates quick tabular data summaries)  
- _survey_ (required for the analysis of complex survey designs)  
- _srvyr_ (a wrapper for _survey_ that gives _dplyr_-like functionality). 

**MRAN Snapshot date:**  
- v0.1.0 16 September 2018  

## Usage

### Local machine

- Install Docker on your machine ([Docker Desktop](https://www.docker.com/products/docker-desktop))

- Open a terminal and run the following commands:
  
  ```
  # Pull the docker image (you only need to do this once)
  $ docker pull kamermanpr/docker-survey:v0.1.4
  
  # Run the container
  $ docker run --name rstudio_survey -d -p 8787:8787 -e USER=rstudio -e PASSWORD=rstudio -e ROOT=TRUE -e GIT_USER="your.name" -e GIT_EMAIL="your.email@gmail.com" -e THEME="Cobalt" kamermanpr/docker-survey:v0.1.4
  ```
  The default options are:
  
  - `--name rstudio_survey` 
  
  - `-e USER=rstudio`
  
  - `-e PASSWORD=rstudio`
  
  - `-e ROOT=TRUE`
  
  - `-e GIT_USER="your.name"`
  
  - `-e GIT_EMAIL="your.email@gmail.com"` 
  
  - `-e THEME="Cobalt"` (I like a dark theme)
  
  Change these options to what works for you, or delete an option all together if you don't need it. 
  
  After the container is up and running, open your browser and enter the following URL: `localhost:8787`, which will take you to the RStudio Server login page. Use the username/password you set (or: rstudio/rstudio) to login and start analysing. If you entered your `git` credentials, perform a `git clone` to get a repo into the container. 

### Cloud

#### DigitalOcean droplet

- Login (or create and login) to your [DigitalOcean](https://www.digitalocean.com/) account.

- Create a new droplet, selecting the _'Docker...'_ image from the selection of _'One-click apps'_.

- Provision the droplet as you see fit, but check the _'User data'_ option under the _'Select additional options'_ section.

- Enter the following in the textbox that opens:

  ```
  #cloud-config

  runcmd:
    - docker pull kamermanpr/docker-survey:v0.1.4
    - docker run --name rstudio_survey -d -p 8787:8787 -e USER=rstudio -e PASSWORD=rstudio -e ROOT=TRUE -e GIT_USER="your.name" -e GIT_EMAIL="your.email@gmail.com" -e THEME="Cobalt" kamermanpr/docker-survey:v0.1.4
  ```
  See the default options in the [Local machine](#local-machine) section above.
  
- Create the droplet, let it launch, and then wait a minute or two while the docker image is pulled and the container launched.

- Copy the IP address for the droplet you created, and paste it into your browser as follows: `<IP ADDRESS>:8787`. This will take you to the RStudio Server login page. Use the username/password you set (or: rstudio/rstudio) to login and start analysing. If you entered your `git` credentials, perform a `git clone` to get a repo into the container. 

#### Amazon EC2 instance

- Login (or create and login) to your [AWS](https://aws.amazon.com/) account.

- Launch a new Ubuntu EC2 instance and provision it as you see fit, but under the the _'Configure Security Group'_ step, include an _'SSH'_, _'HTTP'_ (source: `Anywhere 0.0.0.0/0, ::/0`) and _'HTTPS'_ (source: `Anywhere 0.0.0.0/0, ::/0`) protocols. In the final pop-up window when launching, choose an existing `SSH` key-pair or create a new pair. 

- Once the instance is running, copy the _'Public DNS(IPv4)'_, open a terminal and _`SSH`_ into the instance using the copied address: 

  ```
  $ ssh -i <path to pem file> ubuntu@<Public DNS>  
  ```
  
- Pull the docker image and run the container as follows:

  ```
  # Pull the docker image (you only need to do this once)
  $ sudo docker pull kamermanpr/docker-survey:v0.1.4
  
  # Run the container
  $ sudo docker run --name rstudio_survey -d -p 8787:8787 -e USER=rstudio -e PASSWORD=rstudio -e ROOT=TRUE -e GIT_USER="your.name" -e GIT_EMAIL="your.email@gmail.com" -e THEME="Cobalt" kamermanpr/docker-survey:v0.1.4
  ```
  See the default options in the [Local machine](#local-machine) section above.

- Copy the _'Public DNS(IPv4)'_ for the instance, and paste it into your browser as follows: `<Public DNS>:8787`. This will take you to the RStudio Server login page. Use the username/password you set (or: rstudio/rstudio) to login and start analysing. If you entered your `git` credentials, perform a `git clone` to get a repo into the container. 
