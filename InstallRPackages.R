library(devtools)
install_version("BH", version="1.62.0-1")
install.packages("rstan",dep=T)
install.packages("prophet",dep=T)

packslist <- c('abind','acepack','AER','akima','ape','argparse','arm','ascii','assertthat','aws.s3','aws.signature','backports','base64enc','bayesplot',
               'BB','bdsmatrix','bibtex','bigmemory','bigmemory.sri','bindr','bindrcpp','binman','BiocInstaller','bit','bit64','bitops','blob','bmp',
               'bookdown','BradleyTerry2','brew','brglm','broom','C50','Cairo','car','CARBayes','CARBayesdata','caret','caTools','cba','cellranger',
               'checkmate','chemometrics','chron','Ckmeans.1d.dp','cluster','coda','codetools','coin','colorspace','colourpicker','combinat','commonmark',
               'config','corpcor','covr','coxme','crayon','crosstalk','cubature','Cubist','curl','DAAG','data.table','date','DBI','DBItest','dbplyr',
               'deldir','dendextend','DEoptimR','desc','devtools','dfoptim','DiagrammeR','dichromat','digest','diptest','docopt','doParallel',
               'dotCall64','downloader','dplyr','drat','DT','dtplyr','dummies','dygraphs','dynlm','e1071','earth','ellipse','estimability','evaluate',
               'expm','expsmooth','FactoRizationMachines','fastICA','fields','filehash','findpython','flexmix','FNN','fontBitstreamVera','fontLiberation',
               'fontquiver','forcats','foreach','forecast','foreign','formatR','Formula','fpc','fracdiff','fts','gam','gapminder','gbm','gdata','gdtools',
               'gee','geepack','GenABEL','GenABEL.data','geosphere','getopt','getPass','GGally','ggplot2movies','ggvis','git2r','glmnet',
               'glmnetUtils','glue','gmailr','gmodels','gnm','gof','goftest','googleVis','GPArotation','gplots','gridBase','gridExtra','gsubfn','gtable',
               'gtools','haven','hexbin','highlight','highr','Hmisc','hms','HSAUR','HSAUR2','htmlTable','htmltools','httpuv','httr','hunspell',
               'hwriter','ibdreg','igraph','influenceR','inline','intergraph','intervals','ipred','irlba','ISwR','iterators','itertools',
               'janeaustenr','jose','jpeg','jsonlite','kernlab','KernSmooth','klaR','knitr','labeling','Lahman','lars','lattice','latticeExtra','lava',
               'lava.tobit','lavaan','lazyeval','lazyrmd','LearnBayes','lintr','listviewer','littler','lme4','lmerTest','lmtest','locfit',
               'logspline','loo','lpSolve','lsmeans','lubridate','magrittr','mail','manipulate','mapdata','mapproj','maps','maptools','markdown','MASS',
               'Matrix','matrixcalc','MatrixModels','matrixStats','maxLik','mclust','mcmc','MCMCglmm','MCMCpack','mda','mediation','memoise','MEMSS',
               'Metrics','mets','mgcv','mi','microbenchmark','mime','miniUI','minqa','misc3d','miscTools','mlbench','MLmetrics','mlmRev','mnormt',
               'mockery','ModelMetrics','modelr','modeltools','mondate','mratios','multcomp','multcompView','multicool','multiwayvcov','munsell',
               'mvtnorm','ncdf4','network','neuralnet','nlme','nloptr','NMF','nnet','nor1mix','numDeriv','nycflights13','OpenMPController','openssl',
               'optextras','optimx','ordinal','packagedocs','packrat','pamr','pander','party','partykit','pbdRPC','pbdZMQ','pbivnorm','pbkrtest',
               'PBSmapping','pcaPP','pcse','pingr','pixmap','pkgconfig','pkgKitten','pkgmaker','PKI','PKPDmodels','plm','plogr','plotmo',
               'plotrix','pls','plyr','pmml','png','polyclip','prabclus','praise','prettyunits','pROC','prodlim','profileModel','progress','proto',
               'proxy','pryr','pscl','psych','psychotools','psychotree','purrr','quadprog','quantmod','quantreg','qvcalc','R.cache','R.methodsS3',
               'R.oo','R.rsp','R.utils','R6','randomForest','ranger','RANN','rappdirs','raster','rasterVis','rbenchmark','Rcgmin','RColorBrewer',
               'Rcpp','RcppArmadillo','RcppEigen','Rcsdp','RCurl','readbitmap','readr','readxl','registry','relimp','rematch','remotes',
               'reshape','reshape2','reticulate','rex','rgdal','rgeos','rgexf','RH2','rJava','RJDBC','rjson','RJSONIO','rlang','rmarkdown',
               'rmdshower','RMySQL','rngtools','robustbase','ROCR','RODBC','Rook','roxygen2','rpart','rpart.plot','RPostgreSQL','rprojroot',
               'RSclient','rsconnect','RSelenium','Rserve','rsm','RSQLite','rstantools','rstudioapi','rticles','Rtsne','RUnit','rversions','rvest',
               'Rvmmin','RWeka','RWekajars','sandwich','scagnostics','scales','scatterplot3d','selectr','sem','semver','servr','setRNG','sf',
               'shapefiles','shiny','shinyAce','shinyjs','shinythemes','shinyWidgets','SimComp','sna','som','sourcetools','sp','spam',
               'SparkR','SparseM','spatial','spatstat','spatstat.utils','spdep','sphet','splm','spls','sqldf','StanHeaders','statnet.common',
               'stringdist','stringi','stringr','strucchange','subprocess','subselect','superpc','survival','svglite','svGUI','svUnit','synchronicity',
               'tcltk2','TeachingDemos','tensor','tensorA','testit','testthat','TH.data','threejs','tibble','tidyr',
               'tidyselect','tidyverse','tiff','tikzDevice','timeDate','timereg','timeSeries','tis','trimcluster','tripack','truncnorm',
               'tseries','TTR','tufte','ucminf','udunits2','units','uuid','V8','vcd','vdiffr','viridis','viridisLite','visNetwork','wdman',
               'webshot','whisker','withr','wordcloud2','XML','xtable','xts','yaml','zipcode','zoo','ztable','base','compiler',
               'datasets','graphics','grDevices','grid','methods','parallel','splines','stats','stats4','tcltk','tools','utils','base',
               'boot','class','cluster','codetools','compiler','datasets','foreign','graphics','grDevices','grid','KernSmooth','lattice',
               'MASS','Matrix','methods','mgcv','nlme','nnet','parallel','rpart','spatial','splines','stats','stats4','survival','tcltk','tools','utils')
existingPackages <- row.names(installed.packages())

InstallPacks <- packslist[!packslist %in% existingPackages]

install.packages(InstallPacks,dep=T, repo = 'https://cran.rstudio.com')
remove.packages("data.table")
install.packages("data.table", type = "source",repos = "http://Rdatatable.github.io/data.table") # Then install devel version
install.packages("xgboost", repos=c("http://dmlc.ml/drat/", getOption("repos")), type="source")

install_github("karthik/wesanderson")
install_github("hadley/xml2")
install_github("slowkow/ggrepel")
remove.packages("ggplot2")
install_github("hadley/ggplot2")    # ggthemes is built against the latest ggplot2
install_github("jrnold/ggthemes")
install_github("thomasp85/ggforce")
install_github("thomasp85/ggraph")
install_github("dgrtwo/gganimate")
install_github("dahtah/imager")
install_github("elbamos/largevis", ref="develop")  # Using development branch for now, see https://github.com/elbamos/largeVis/issues/40
install_github("dgrtwo/widyr")
install_github("rstudio/leaflet")
install_github("rstudio/tensorflow")
install_github("rstudio/sparklyr")
install_github('ramnathv/htmlwidgets')
install_github("mukul13/rword2vec")
install_github("ropensci/plotly")
install.packages("openNLPmodels.en",repos = "http://datacube.wu.ac.at/",type = "source")
install.packages("h2o", type="source", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/latest_stable_R"))) # install the latest stable version of h2o

# Jupyter Notebooks configration
install.packages(c('crayon', 'pbdZMQ'))
devtools::install_github(paste0('IRkernel/', c('repr', 'IRdisplay', 'IRkernel')))
Sys.setenv(PATH = "/opt/conda/bin:$PATH")
IRkernel::installspec()
IRkernel::installspec(user = FALSE)