ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:stable
FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"
LABEL org.opencontainers.image.source=https://github.com/Frank-Junran-Yang/DSC180A-Methodology-5

# install system packages as root
USER root
RUN apt-get update && apt-get -y install aria2 nmap traceroute

# install Python packages as the notebook user
USER jovyan
RUN pip install --no-cache-dir "numpy<2" geopandas babypandas==0.1.5

# start a shell instead of Jupyter
CMD ["/bin/bash"]
