# Sparkly Connection
library(sparklyr)
library(dplyr)

Sys.setenv(SPARK_HOME = '/usr/local/spark') # spark home env set up

config <- spark_config() # Spark Configuration
config$spark.executor.cores <- 6
config$spark.executor.memory <- "8G"
config$spark.driver.memory <- "8G"
config$spark.local.dir <- '/tmp/'
sc <- spark_connect(master = "local",config = config, spark_home = Sys.getenv("SPARK_HOME")) # Spark context
df <- spark_read_csv(sc, 'file1', "/home/data/ReadCSVFile.csv", header = TRUE, delimiter = ",") # readin a file
df %>% head(10)

# SparkR Connection
Sys.setenv(SPARK_HOME = '/usr/local/spark') # spark home env set up
library(SparkR)

sparkR.session(master = "local", sparkConfig = list(spark.executor.cores = 6,
                                                    spark.driver.memory = "8g",
                                                    spark.driver.memory = "8g",
                                                    spark.local.dir = '/tmp/'))

df <- read.df("/home/data/ReadCSVFile.csv",'csv', header = "true")
head(df)
printSchema(df)


# Please follow instruction/documentation on
# https://spark.apache.org/docs/2.1.0/sparkr.html