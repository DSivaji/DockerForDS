

# Docker for Data science

This comes with:

1. R with hadleyverse packages and other important packages 
2. Python 3 with xgboost, light, catboost, tensorflow, theano, keras, MXNet and so on...
3. Standalone spark 2.1.1
4. Configured R on IPython notebook

Follow below instructions to create a docker machine

#### Create a docker machine #
``` docker-machine create -d virtualbox --virtualbox-cpu-count=6 --virtualbox-memory=24000 --virtualbox-disk-size=50000 default ```

Build a docker from the dockerfil

``` docker build -t fullstack . ```

You can change configuration as you needed

###### To get interactive R studio
``` docker run -it -v ${PWD}:/home/data -p 8787:8787 fullstack ```

###### To start ipython notebook
``` docker run -d -it -v ${PWD}:/home/data -p 8888:8888 fullstack:latest bash /home/files/StartPython.sh ```
