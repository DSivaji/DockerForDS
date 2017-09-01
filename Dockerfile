FROM rocker/hadleyverse

USER root

# Directories and base env setup
RUN	cd /home \
	&& chmod 777 -R rstudio \ 
	&& mkdir files data spark Sparktemp \
	&& chmod 777 -R files data spark Sparktemp

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH /usr/lib/jvm/java-8-openjdk-amd64:$PATH
ENV LD_LIBRARY_PATH /usr/lib/jvm/java-8-openjdk-amd64/lib/amd64:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server
ENV _JAVA_OPTIONS "-Xms20000m -Xmx20000m"

# system update and base libraries
RUN	apt-get update \
	&& apt-get install -y --fix-missing zip wget cmake bzip2 ca-certificates libzmq3-dev libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion libfontconfig1 libxml2-dev libcairo2-dev libxt-dev libudunits2-dev libjpeg-dev freetds-dev libfreetype6-dev graphviz\
	&& R CMD javareconf \
	&& apt-get install -y r-cran-rjava 

# Install Anaconda3
RUN	cd /home/files/ \
	&& wget https://download.microsoft.com/download/F/0/F/F0FF3F95-D42A-46AF-B0F9-8887987A2C4B/sqljdbc_4.2.8112.100_enu.tar.gz \ 
	&& tar -xsf sqljdbc_4.2.8112.100_enu.tar.gz 
	
RUN	cd /tmp/ \
	&& wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh \
	&& /bin/bash Anaconda3-4.4.0-Linux-x86_64.sh -b -p /opt/conda \
	&& rm -rf /tmp/*
	
ENV PATH /opt/conda/bin:$PATH

RUN cd /home/files \
	&& echo "ipython notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token=''" >> StartPython.sh

RUN conda update --all
	
# Spark Instlation
RUN	cd /tmp/ \
	&& wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz \
	&& tar -xvzf spark-2.1.1-bin-hadoop2.7.tgz -C /usr/local \
    && rm spark-2.1.1-bin-hadoop2.7.tgz \
	&& cd /usr/local && ln -s spark-2.1.1-bin-hadoop2.7 spark \
	&& rm -rf /tmp/*

ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip

# SparkR Packages
RUN R -e "devtools::install_github('apache/spark@v2.1.1', subdir='R/pkg')"
	
# Python packages	
RUN pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git \
	&& conda install -y -c https://conda.anaconda.org/amueller wordcloud \
	&& pip install findspark tensorflow folium keras python-igraph chainer textblob fbprophet stop-words h2o lightgbm catboost pymssql mxnet graphviz\
	&& conda install -y -c conda-forge xgboost

# Catboost for R
RUN cd /tmp \
	&& git clone https://github.com/catboost/catboost.git \
	&& cd ./catboost/catboost/R-package \
	&& R -e 'devtools::install()'

# LightGBM for R
RUN cd /tmp \
	&& git clone --recursive https://github.com/Microsoft/LightGBM \
	&& cd LightGBM/R-package \
	&& R CMD INSTALL --build . --no-multiarch
	
RUN mkdir -p /usr/share/nltk_data \
    && python -m nltk.downloader -d /usr/share/nltk_data all \
    && rm -rf /root/.cache/pip/* \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /usr/local/src/*

COPY InstallRPackages.R /home/files/InstallRPackages.R
RUN R -e 'source("/home/files/InstallRPackages.R")'

WORKDIR /home/data