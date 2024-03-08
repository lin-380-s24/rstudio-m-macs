# Dockerfile

# Use the rocker/rstudio image as the base image.
FROM rocker/rstudio:latest

# Update the linux system/ install apt-get packages.
RUN apt-get -y update && \
    apt-get -y install \
    libxt6 \
    zlib1g-dev \
    libpng-dev \
    libpoppler-cpp-dev \
    libxml2-dev \
    libgit2-dev \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libssl-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libtiff5-dev \
    libjpeg-dev \
    cmake \
    pandoc \
    python3

# Clean up the apt-get installations.
RUN rm -rf /var/lib/apt/lists/*

# Add a line to the Rsession config.
RUN echo "copilot-enabled=1" >>/etc/rstudio/rsession.conf

# Add rstudio user to sudo group.
RUN usermod -aG sudo rstudio

# Set the working directory.
WORKDIR /home/rstudio

# Run as the rstudio user.
USER rstudio

# Quarto install tinytex
RUN quarto install tinytex

# Copy the renv.lock file.
COPY renv.lock /home/rstudio/

# Install renv and restore the package library from the renv.lock file.
RUN R -e "install.packages(c('renv', 'remotes'), repos = 'https://cran.rstudio.com')" && \
    R -e "renv::restore()"

# Remove the renv.lock file.
RUN rm /home/rstudio/renv.lock

# Install tinytex for Quarto support.
RUN R -e "remotes::install_github(c('qtalr/qtalrkit','TalkBank/TBDBr','quanteda/quanteda.corpora'))"

# Create the Lessons directory.
RUN mkdir -p /home/rstudio/Lessons

# Create the Workspace directory for students' projects.
RUN mkdir -p /home/rstudio/Workspace

# Return to root.
USER root

# Copy rstudio-prefs.json
COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN chown rstudio:rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json

# Add the swirl-setup.R file
COPY swirl-setup.R /home/rstudio/Lessons/swirl-setup.R
RUN chown rstudio:rstudio /home/rstudio/Lessons/swirl-setup.R


