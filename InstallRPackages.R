Sys.setenv(MAKEFLAGS = "-j4") 
install.packages(c("Rcpp", "rstan"), type = "source")
install.packages(c('shinystan','rstanarm','RODBC','RJDBC','lsmeans','xgboost','RLightGBM','caret'),dep=T, repo = 'https://cran.rstudio.com')
library(devtools)
install_github("hadley/xml2")
install_github("slowkow/ggrepel")
install_github("hadley/ggplot2")    # ggthemes is built against the latest ggplot2
install_github("jrnold/ggthemes")
install_github("thomasp85/ggforce")
install_github("thomasp85/ggraph")
install_github("dgrtwo/gganimate")
install_github("dahtah/imager")
install_github("elbamos/largevis", ref="develop")  # Using development branch for now, see https://github.com/elbamos/largeVis/issues/40
install_github("dgrtwo/widyr")
install_github("rstudio/leaflet")
install.packages("xgboost", repos=c("http://dmlc.ml/drat/", getOption("repos")), type="source")
install_github("rstudio/tensorflow")
install_github("rstudio/sparklyr")
install_github('ramnathv/htmlwidgets')
install_github("mukul13/rword2vec")
install_github("ropensci/plotly")
install.packages("openNLPmodels.en",repos = "http://datacube.wu.ac.at/",type = "source")
install.packages("h2o", type="source", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/latest_stable_R"))) # install the latest stable version of h2o

listofpackages <- c('Rtsne','abind','acepack','assertthat','backports','base','base64','base64enc','BH','binman','BiocGenerics','BiocInstaller','bitops','bmp','boot','BradleyTerry2','brew','brglm','broom','car','caret','caTools','CHAID','chron','Ckmeans.1d.dp','class','cluster','codetools','coin','colorspace','combinat','compiler','config','corpcor','covr','crayon','curl','data.table','datasets','DBI','deepnet','DiagrammeR','dichromat','digest','doParallel','dplyr','drat','dtplyr','dummies','dygraphs','e1071','earth','EBImage','ellipse','evaluate','fastICA','fftwtools','foreach','forecast','foreign','formatR','Formula','fracdiff','gam','gdata','gdtools','GenABEL','GenABEL.data','GGally','ggplot2','ggplot2movies','ggthemes','ggvis','git2r','gmailr','gplots','graphics','grDevices','grid','gridBase','gridExtra','gsubfn','gtable','gtools','hexbin','highr','Hmisc','hms','htmlTable','htmltools','htmlwidgets','httpuv','httr','hunspell','imager','influenceR','ipred','IRdisplay','IRkernel','irlba','ISwR','iterators','jpeg','jsonlite','kernlab','KernSmooth','klaR','knitr','labeling','Lahman','lattice','latticeExtra','lava','lazyeval','leaflet','lintr','listviewer','lme4','lmtest','locfit','lubridate','magrittr','mapproj','maps','maptools','markdown','MASS','Matrix','MatrixModels','mda','memoise','methods','Metrics','mgcv','microbenchmark','mime','miniUI','minqa','mlbench','MLmetrics','mnormt','ModelMetrics','modeltools','multcomp','munsell','mvtnorm','mxnet','nlme','nloptr','NMF','nnet','numDeriv','nycflights13','openssl','pamr','parallel','party','partykit','pbdZMQ','pbkrtest','pkgmaker','plogr','plotly','plotmo','plotrix','pls','plyr','png','praise','prettyunits','pROC','prodlim','profileModel','progress','proto','proxy','psych','purrr','quadprog','quantreg','R6','randomForest','ranger','RANN','rappdirs','raster','RColorBrewer','Rcpp','RcppArmadillo','RcppEigen','RCurl','readbitmap','readr','registry','repr','reshape','reshape2','rex','rgdal','RH2','rhdf5','rJava','RJDBC','RJSONIO','rmarkdown','RMySQL','rngtools','ROCR','RODBC','roxygen2','rpart','RPostgreSQL','rprojroot','RSclient','RSelenium','Rserve','RSQLite','rstudioapi','rversions','sandwich','scales','semver','shiny','shinyjs','sourcetools','sp','sparklyr','SparkR','SparseM','spatial','splines','spls','sqldf','stats','stats4','stringdist','stringi','stringr','strucchange','subprocess','subselect','superpc','survival','svglite','svUnit','tcltk','TeachingDemos','testit','testthat','TH.data','tibble','tidyr','tiff','timeDate','tools','translations','utils','uuid','vcd','viridis','viridisLite','visNetwork','wdman','webshot','whisker','withr','xgboost','XML','xtable','xts','yaml','zlibbioc','zoo')
installpackages <- listofpackages[!listofpackages %in% row.names(installed.packages())]
install.packages(installpackages,dep=T,repos = "https://cloud.r-project.org/")
remove.packages("data.table")
install.packages("data.table", type = "source",repos = "http://Rdatatable.github.io/data.table") # Then install devel version

# ipython configration
install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'uuid', 'digest'))
devtools::install_github('IRkernel/IRkernel')
Sys.setenv(PATH = "/opt/conda/bin:$PATH")
IRkernel::installspec()
IRkernel::installspec(user = FALSE)