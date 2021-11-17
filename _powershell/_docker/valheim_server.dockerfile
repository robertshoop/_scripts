# Work in progress!!!
# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:latest
 
# Identify the maintainer of an image
LABEL maintainer="testemail@someemail.com"

# Update the image to the latest packages
RUN apt-get update && apt-get dist-upgrade && apt-get upgrade -y

# RUN add-apt-repository multiverse -y
# RUN dpkg --add-architecture i386
# RUN apt update

# Install SteamCMD.
RUN apt-get install lib32gcc-s1 -y
RUN apt-get install openssh-server -y

#RUN apt-get install steamcmd -y

# Install Valheim Dedicated Server
# RUN /usr/games/steamcmd +force_install_dir /usr/games/valheim +login anonymous +app_update 896660 validate +quit

# Expose port 22 (SSH), 2456-2458 (Valheim Dedicated Server)
EXPOSE 22
EXPOSE 2456-2458

# Last is the actual command to start up NGINX within our Container
# CMD ["nginx", "-g", "daemon off;"]