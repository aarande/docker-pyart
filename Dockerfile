FROM continuumio/miniconda
MAINTAINER Aaron Anderson

RUN groupadd -r pyart && useradd --no-log-init -ms /bin/bash -r -g pyart pyart
RUN apt-get update && apt-get install -y gcc git libgl1-mesa-glx && apt-get clean
RUN conda config --append channels conda-forge &&\
    conda config --append channels http://conda.anaconda.org/jjhelmus && \
    conda install --yes numpy scipy jupyter matplotlib netcdf4 pyproj basemap nose pillow owslib pyepsg cartopy \
    trmm_rsl arm_pyart && conda clean --all

EXPOSE 8888
RUN mkdir /opt/notebooks /opt/radar && chown pyart:pyart /opt/notebooks && chown pyart:pyart /opt/radar
VOLUME /opt/notebooks /opt/radar
USER pyart
CMD ["python"]