## R Programming - Programming assignment 1
pollutantmean <- function (directory, pollutant, id = 1:332) {
  sumtotal <- 0
  numtotal <-0
  n <- length(id)
  for (i in 1:n){
    archivo <- paste("000", toString(id[i]), sep="")
    archivo <- substr(archivo, nchar(archivo)-2, nchar(archivo))
    archivo <- paste(directory,"\\",archivo, ".csv", sep="")
    d1 <- read.csv(archivo, header=TRUE)
    v1 <- d1[[pollutant]]
    v2 <- is.na(v1)
    v3 <- v1[!v2]
    sumtotal <- sumtotal + sum(v3)
    numtotal <- numtotal + length(v3)
  }
  sumtotal / numtotal
}