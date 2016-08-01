#find trading pairs
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/26/2016

#function: calculate trading pairs
#mat_ccor: cross-correlation matrix
#mat_dt: delta-t matrix
#return: a tuple of one logical matrix and one list
# (the logical matrix indicates whether symbols on col and on row are trading subjects according to delta-t portfolio strategy)
calc_trading_pairs <- function(mat_ccor, mat_dt, min_ccor, min_dt, max_dt) {
  vec_trading_pairs = c()
  lst_trading_pairs_code = list()
  mat_tradable_corr = mat_ccor > min_ccor
  mat_tradable_dt = (mat_dt > min_dt) & (mat_dt < max_dt)
  mat_tradable = mat_tradable_corr & mat_tradable_dt
  
  for (i in c(1:length(mat_tradable[ , 1]))) {
    for (j in c(1:length(mat_tradable[1, ]))) {
      #constraint requirement for a trading pair to be practical
      if (mat_tradable[i, j] == T) {
        vec_trading_pairs = c(vec_trading_pairs, 
                              paste(names(mat_tradable[, 1][i]),
                                    names(mat_tradable[1, ][j]))
        )
        lst_trading_pairs_code[[length(lst_trading_pairs_code) + 1]] = c(i, j)
      }
    }
  }
  
  return(list(mat_tradable, vec_trading_pairs, lst_trading_pairs_code))
}

