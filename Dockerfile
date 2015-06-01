FROM ubuntu:14.04.1

RUN apt-get update && apt-get install -y \
        software-properties-common \
        python-software-properties \
        git

# Installing inkscape
RUN add-apt-repository ppa:inkscape.dev/stable \
        && apt-get update \
        && apt-get install -y --no-install-recommends inkscape=0.91.0+47~ubuntu14.04.1

# Installing fonts
COPY lib/install-google-fonts /tmp/
RUN /tmp/install-google-fonts

# Cleaning
RUN apt-get clean
