This docker image contains a full PyART (http://arm-doe.github.io/pyart/) environment including Cartopy and Jupyter notebooks.

The current image is based off miniconda and runs Python 2.7. Other versions coming soon.

Two volumes are available for persistent data
/opt/notebooks - for Jupyter notebooks
/opt/radar - for radar files

Example Docker Run command for Jupyter Notebook...this will mount the current notebooks and radar folders in the current working directory into the container. The Jupyter Notebook can then be access at the address shown in the log as it will contain the required token.
docker run --rm -it -p 8888:8888 --name pyart -v `pwd`/notebooks:/opt/notebooks -v `pwd`/radar:/opt/radar aarande/docker-pyart /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"