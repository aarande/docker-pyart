FROM continuumio/miniconda
MAINTAINER Aaron Anderson

RUN groupadd -r pyart && useradd --no-log-init -r -g pyart pyart
RUN apt-get update && apt-get install -y gcc git libgl1-mesa-glx && apt-get clean
RUN conda config --append channels conda-forge &&\
    conda config --append channels http://conda.anaconda.org/jjhelmus && \
    conda install --yes numpy scipy jupyter matplotlib netcdf4 pyproj basemap nose pillow owslib pyepsg cartopy \
    trmm_rsl && conda clean --all
RUN git clone https://github.com/ARM-DOE/pyart.git &&\
    cd pyart &&\
    python setup.py install &&\
    python setup.py clean --all

RUN mkdir /opt/notebooks
VOLUME /opt/notebooks
EXPOSE 8888
USER pyart
CMD ["python"]