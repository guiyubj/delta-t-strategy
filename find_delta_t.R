#find_delta_t
#Yu Gui
#China Asset Management Co.
#7/20/2016

#function: calculate correlation of timeseries with a delay
#d_t: the time of the delay
#vec_ts1: timeseries1
#vec_ts2: timeseries2
#return: the calculated correlation
calc_delayed_cor <- function(vec_ts1, vec_ts2, d_t) {
  # cat('length of syb1:', length(vec_ts1[1:(length(vec_ts1) - d_t)]), '\n')
  # cat('length of syb1:', length(vec_ts2[(1 + d_t):length(vec_ts2)]), '\n')
  correlation = 
    cor(vec_ts1[1:(length(vec_ts1) - d_t)], 
        vec_ts2[(1 + d_t):length(vec_ts2)],
        method = 'pearson')
  
  return(correlation)
}


#function: calculate the delta_t,
#which, could shift the timeseries, and help the timeseries to achieve highest correlation
#vec_ts1: timeseries1
#vec_ts2: timeseries2
#max_t: the maximum delta_t allowed
#(delta_t needs to be limited to a practical range)
#(if the delta_t to achieve the highest correlation is too long, it becomes meaningless)
#return: the delta_t
find_delta_t_corr <- function(vec_ts1, vec_ts2, max_t) {
  #Check incoming data
  if (!is.numeric(vec_ts1) || !is.numeric(vec_ts2)) {
    print('vec_ts1: ')
    print(vec_ts1)
    print('vec_ts2: ')
    print(vec_ts2)
    stop('Invalid timeseries')
  }
  
  mat_all_corr = matrix(nrow = 2, ncol = max_t + 1) #matrix of delta_t and correlation
  mat_all_corr[1, ] = c(0 : max_t)
  
  # #DEBUG
  # cat(c('\nDimension of input timeseries:', dim(vec_ts1), dim(vec_ts2), '\n'))
  # cat(c(('Generating empty array of (corr, delta_t) tuples: '), '\n'))
  # print(mat_all_corr)
  
  for (i in mat_all_corr[1, ]){
    corr = calc_delayed_cor(vec_ts1, vec_ts2, i)
    mat_all_corr[, 1 + i] = c(i, corr)
    
  }
  
  # #DEBUG
  # print('Calculated array of (corr, delta_t) tuples: ')
  # print(mat_all_corr)
  
  
  max_corr = max(mat_all_corr[2, ])
  for (i in mat_all_corr[1, ]) {
    if (mat_all_corr[2, i + 1] == max_corr) {
      cat('\nMax corr:', mat_all_corr[2, i + 1], 
          'achieved at delta_t =', mat_all_corr[1, i + 1], '\n')
      return(mat_all_corr[, i + 1])
    }
  }
  
  stop('Failed to find max corr')
  
}
