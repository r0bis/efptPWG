gg_range <- function(x) {
  p <- as.data.frame(c(min(x), max(x)))
  colnames(p) <- c("ymin","ymax")
  p
}



  p <- data.frame(ymin=min(x), ymax=max(x))

