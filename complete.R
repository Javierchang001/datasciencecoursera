complete <- function (directory, id=1:332){

  df <- data.frame(id=integer(), nobs=integer())
  for (i in 1:length(id)){
    archivo <- paste("000", toString(id[i]), sep="")
    archivo <- substr(archivo, nchar(archivo)-2, nchar(archivo))
    archivo <- paste(directory,"\\",archivo, ".csv", sep="")
    d1 <- read.csv(archivo, header=TRUE)
    l <- length(d1$Date[!is.na(d1$sulfate) & !is.na(d1$nitrate)])
    df <- rbind(df, list(id[i], l))
  }
  names(df) <- c("id", "nobs")
  df
}