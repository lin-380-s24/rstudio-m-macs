# Linguistics RStudio Setup for Apple Silicon Macs

> This is a step-by-step guide to create a container on Docker.app for Apple Silicon (and other) Macs to run the course materials for Linguistics 380.

## Table of Contents

- [Linguistics RStudio Setup for Apple Silicon Macs](#linguistics-rstudio-setup-for-apple-silicon-macs)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Pull the Docker Image](#pull-the-docker-image)
  - [Create a Container](#create-a-container)
  - [Run the Container](#run-the-container)
  - [Report issues](#report-issues)

## Prerequisites

We are going to start from scratch, well not quite, but mostly. Here are a few things you need to do to prepare your system setup for the next steps.

1. Find the folder on your computer that you have your existing Docker container connected to. Copy/ paste that folder to your Desktop to back it up so we make sure we don't lose anything you've created in the class so far.
2. Go to Docker.app and navigate to the Containers tab. Make sure to stop the container you are currently using for RStudio and then delete it by clicking the trash can icon.

You can now move to step 1 of this new setup.

## Pull the Docker Image

Navigate to the Images tab in Docker.app. We are going to use the `francojc/rstudio-m-macs` image to create a new container. You wil need to pull it by using the search bar at the top of the Images tab and type `francojc/rstudio-m-macs`. Click on the image and then click the `Pull` button.

## Create a Container

In this step, we are going to create a new container using the `francojc/rstudio-m-macs` image. The container configurations are very similar to the previous container you created, but make sure to not skip any steps in the configuration.

1. Run the `francojc/rstudio-m-macs` image by clicking the `Run` button.
2. Expand the configuration and fill out the following fields:
   1. **Name**: `linguistics-rstudio`
   2. **Port**: `8787`
   3. **Volume**: Click the `...` button and add the path to the folder that you used for the previous RStudio container[^note]. This will allow you to access the files you have already created. Then, make sure to map the folder on your computer to `/home/rstudio/Workspace/` in the container.
   4. **Environment Variables**:
      1. `PASSWORD`: your_password

Click `Run` to create the container.

[^note]: *If the previous folder does not exist, create a new folder for this container and map it to `/home/rstudio/Workspace/` in the container. After you create the container, you can copy the files from the old folder to the new folder.*

## Run the Container

The container should now be running. You can access RStudio by going to `localhost:8787` in your web browser. Use the username `rstudio` and the password you set in the environment variables to log in.

## Report issues

If you encounter any issues, please report them to the instructor or the TA. We will be happy to help you troubleshoot any problems you encounter.

