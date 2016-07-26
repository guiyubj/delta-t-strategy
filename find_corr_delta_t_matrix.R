#find_corr_delta_t_matrix
#Yu Gui
#China Asset Management Co.
#7/21/2016

#function: find the correlation-(delta-t) matrix
find_corr_delta_t_matrix <- function(w_wsd_data, max_dt = 180, idx = 'scd') {
  #define max_delta_t
  max_delta_t = max_dt
  
  #get data
  vec_idx_code = get_industry_index_list(idx)
  vec_date = w_wsd_data$Data$DATETIME
  # vec_ts1 = w_wsd_data$Data$'882001.WI' / w_wsd_data$Data$'000001.SH'
  # vec_ts2 = w_wsd_data$Data$'882007.WI' / w_wsd_data$Data$'000001.SH'
  
  mat_corr = matrix(nrow = (length(w_wsd_data$Data) - 1), 
                    ncol = (length(w_wsd_data$Data) - 1), 
                    dimnames = list(vec_idx_code, vec_idx_code))
  cat(c('Dim of the correlation matrix:', dim(mat_corr), '\n'))
  
  for (i in c(1 : length(mat_corr[1, ]))) {
    for (j in c(1 : length(mat_corr[, 1]))) {
      
      if (is.null(w_wsd_data$Data[i + 1]) || is.null(w_wsd_data$Data[j + 1])) { #data validation
        #if one of the timeseries is NULL, stop and report error
        cat(c("i:", i, '\n', 'j:', j, '\n'))
        cat(c("w_wsd_data$Data[i]:", w_wsd_data$Data[i + 1][ , 1], '\n', 
              'w_wsd_data$Data[j]:', w_wsd_data$Data[j + 1][ , 1], '\n'))
        stop('Null timeseries in find_corr_delta_t_matrix.R')
      }
      else {
        #else proceed with correlation calculation
        mat_corr[i, j] = max(ccf(w_wsd_data$Data[i + 1][ , 1],
                                 w_wsd_data$Data[j + 1][ , 1],
                                 max_delta_t, 
                                 plot = F)$acf)
      }
    }
  }
  
  return(mat_corr)
}

