#find trading pairs
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/26/2016

#define parameters
MIN_CORR = 0.2
MIN_DT = 10
MAX_DT = 100

calc_trading_pairs <- function(mat_ccor, mat_dt) {
  lst_trading_pairs = list()
  for (i in c(1:length(mat_ccor[1, ]))) {
    for (j in c(1:length(mat_ccor[ , 1]))) {
      #constraint requirement for a trading pair to be practical
      if ((mat_ccor[i,j] > MIN_CORR) & 
          (mat_dt[i, j] > MIN_DT) & 
          (mat_dt[i, j] < MAX_DT)) {
        print(mat_ccor[i, j])
        print(mat_dt[i, j])
        lst_trading_pairs = c(lst_trading_pairs, 
                              paste(names(mat_ccor[i, ]),
                                    names(mat_ccor[, j]))
                              )
      }
    }
  }
  
  return(lst_trading_pairs)
}

