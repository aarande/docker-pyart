This docker image contains a full PyART (http://arm-doe.github.io/pyart/) environment including Matplotlib, Basemap, Cartopy, TRMM RSL, wradlib, nexradaws, and Jupyter notebooks.

Docker Hub Link - https://hub.docker.com/r/aarande/docker-pyart/

The images are based off miniconda and the latest tag runs Python 3. There is also a python2.7 version available..please refer to the tags for names.

Two volumes are available for persistent data
/opt/notebooks - for Jupyter notebooks
/opt/radar - for radar files
/opt/source - for source code

You can easily mount your own code and radar files into the container and run your own script. The below command will mount the
current host directory into the container and run the python script specified.

~~~
docker run --name pyart -v `pwd`:/opt/source aarande/docker-pyart <scriptname>.py
~~~

Example Docker Run command to mount radar folder in current host directory into container and get an interactive python prompt, container is removed when stopped.

~~~
docker run -it --rm --name pyart -v `pwd`/radar:/opt/radar aarande/docker-pyart
~~~

Example Docker Run command for Jupyter Notebook...this will mount the current notebooks and radar folders in the current working directory into the container. The Jupyter Notebook can then be access at the address shown in the log as it will contain the required token.

~~~
docker run --rm -it -p 8888:8888 --name pyart -v `pwd`/notebooks:/opt/notebooks -v `pwd`/radar:/opt/radar aarande/docker-pyart /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"
~~~

