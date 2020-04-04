corr <- function(directory, threshold=0){
  
  n <- 0
  vResultado <- vector()
  for (i in 1:332){
    archivo <- paste("000", toString(i), sep="")
    archivo <- substr(archivo, nchar(archivo)-2, nchar(archivo))
    archivo <- paste(directory,"\\",archivo, ".csv", sep="")
    d1 <- read.csv(archivo, header=TRUE)
    numCompleteCases <- length(d1$Date[!is.na(d1$sulfate) & !is.na(d1$nitrate)])
    if (numCompleteCases > threshold){
      n <- n + 1
      vResultado[n]=cor(d1$sulfate[!is.na(d1$sulfate) & !is.na(d1$nitrate)], d1$nitrate[!is.na(d1$sulfate) & !is.na(d1$nitrate)])
    }
  }
  vResultado
}