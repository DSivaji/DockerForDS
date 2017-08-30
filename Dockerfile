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
ENV _JAVA_OPTIONS "-Xms20480m -Xmx20480m"

# system update and base libraries
RUN	apt-get update \
	&& apt-get install -y --fix-missing zip wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion libfontconfig1 libxml2-dev libcairo2-dev libxt-dev libudunits2-dev libjpeg-dev freetds-dev libfreetype6-dev\
	&& R CMD javareconf \
	&& apt-get install -y r-cran-rjava 

# Install Anaconda3
RUN	cd /home/files/ \
	&& wget https://download.microsoft.com/download/F/0/F/F0FF3F95-D42A-46AF-B0F9-8887987A2C4B/sqljdbc_4.2.8112.100_enu.tar.gz \ 
	&& tar -xsf sqljdbc_4.2.8112.100_enu.tar.gz 
	
RUN	cd /tmp/ && wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh

RUN /bin/bash /tmp/Anaconda3-4.4.0-Linux-x86_64.sh -b -p /opt/conda
	
ENV PATH /opt/conda/bin:$PATH

RUN cd /home/files \
	&& echo "ipython notebook --ip=0.0.0.0 --port=8888 --allow-root --NotebookApp.token=''" >> StartPython.sh

RUN cd /usr/local/src \
	&& conda update --all
	
# Spark Instlation
RUN	cd /tmp/ \
	&& wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz \
	&& tar -xvzf spark-2.1.1-bin-hadoop2.7.tgz -C /usr/local \
    && rm spark-2.1.1-bin-hadoop2.7.tgz \
	&& cd /usr/local && ln -s spark-2.1.1-bin-hadoop2.7 spark \
	&& rm -rf /tmp/* \
	&& rm -rf /root/.cache/*

ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.4-src.zip

# SparkR Packages
RUN R -e "devtools::install_github('apache/spark@v2.1.1', subdir='R/pkg')"

# Python packages	
RUN pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git \
	&& pip install git+git://github.com/amueller/word_cloud.git \
	&& pip install findspark tensorflow folium keras python-igraph chainer textblob stop-words h2o catboost pymssql \
	&& conda install -y -c conda-forge xgboost \
	&& wget https://bootstrap.pypa.io/get-pip.py \
	&& python get-pip.py \
	&& pip install mxnet \
	&& conda install dask \
	&& apt-get install -y graphviz \
	&& pip install graphviz \
    && mkdir -p /usr/share/nltk_data \
    && python -m nltk.downloader -d /usr/share/nltk_data abc alpino averaged_perceptron_tagger \
    basque_grammars biocreative_ppi bllip_wsj_no_aux \
	book_grammars brown brown_tei cess_cat cess_esp chat80 city_database cmudict \
	comtrans conll2000 conll2002 conll2007 crubadan dependency_treebank \
	europarl_raw floresta gazetteers genesis gutenberg hmm_treebank_pos_tagger \
	ieer inaugural indian jeita kimmo knbc large_grammars lin_thesaurus mac_morpho machado \
	masc_tagged maxent_ne_chunker maxent_treebank_pos_tagger moses_sample movie_reviews \
	mte_teip5 names nps_chat omw opinion_lexicon paradigms \
	pil pl196x porter_test ppattach problem_reports product_reviews_1 product_reviews_2 propbank \
	pros_cons ptb punkt qc reuters rslp rte sample_grammars semcor senseval sentence_polarity \
	sentiwordnet shakespeare sinica_treebank smultron snowball_data spanish_grammars \
	state_union stopwords subjectivity swadesh switchboard tagsets timit toolbox treebank \
	twitter_samples udhr2 udhr unicode_samples universal_tagset universal_treebanks_v20 \
	vader_lexicon verbnet webtext word2vec_sample wordnet wordnet_ic words ycoe \
    # clean up
    && rm -rf /root/.cache/pip/* \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /usr/local/src/*
	
COPY InstallRPackages.R /home/files/InstallRPackages.R
RUN R -e 'source("/home/files/InstallRPackages.R")'

# Catboost for R
RUN cd /tmp \
	&& git clone https://github.com/catboost/catboost.git \
	&& cd ./catboost/catboost/R-package \
	&& R -e 'devtools::install()'

# LightGBM for R
RUN apt-get update \
	&& apt-get install cmake \
	&& git clone --recursive https://github.com/Microsoft/LightGBM  \
	&& cd LightGBM \
	&& mkdir build \ 
	&& cd build \
	&& cmake .. \
	&& make -j4
	
WORKDIR /home/data


