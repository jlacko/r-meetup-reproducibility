 # syntax=docker/dockerfile:1
FROM rocker/rstudio:4.1.0

# external depencencies as deb packages
# each apt call absoluterly positively must be on a single line (so that update & install end up in the same Docker cache)
RUN apt-get update && apt-get -y install libxml2-dev
RUN apt-get update && apt-get -y install zlib1g-dev

# R packages from POSIT
# first for actual packages to be used for class / these will be installation specific
RUN R -e "options(warn=2); install.packages('tidyverse', repos = 'https://packagemanager.rstudio.com/cran/2022-06-01')"
RUN R -e "options(warn=2); install.packages('wesanderson', repos = 'https://packagemanager.rstudio.com/cran/2022-06-01')"


