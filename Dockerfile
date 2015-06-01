FROM ubuntu:14.04.1

RUN apt-get update -qq
RUN apt-get upgrade -qq

RUN apt-get install -y -qq software-properties-common python-software-properties
RUN add-apt-repository ppa:inkscape.dev/stable
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends inkscape=0.91.0+47~ubuntu14.04.1

# Installing fonts
RUN apt-get install -y -qq git
COPY lib/install-google-fonts /tmp/
RUN /tmp/install-google-fonts

# Cleaning
RUN apt-get clean
