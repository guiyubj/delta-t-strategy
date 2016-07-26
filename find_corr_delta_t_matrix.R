#find_corr_delta_t_matrix
#Yu Gui
#China Asset Management Co.
#7/21/2016

#function: find the correlation-(delta-t) matrix
find_corr_delta_t_matrix <- function(w_wsd_data, w_sh_data, max_dt = 180, idx = 'scd') {
  #define max_delta_t
  max_delta_t = max_dt
  
  #get data
  vec_idx_code = get_industry_index_list(idx)
  vec_date = w_wsd_data$Data$DATETIME
  
  #create a empty matrix to store cross-correlation
  mat_ccor = matrix(nrow = (length(w_wsd_data$Data) - 1), 
                    ncol = (length(w_wsd_data$Data) - 1), 
                    dimnames = list(vec_idx_code, vec_idx_code))
  #create a empty matrix to store delta-t
  mat_dt = mat_ccor
  cat(c('Dim of the correlation matrix:', dim(mat_ccor), '\n'))
  
  for (i in c(1 : length(mat_ccor[1, ]))) {
    for (j in c(1 : length(mat_ccor[, 1]))) {
      
      if (is.null(w_wsd_data$Data[i + 1]) || is.null(w_wsd_data$Data[j + 1])) { #data validation
        #if one of the timeseries is NULL, stop and report error
        cat(c("i:", i, '\n', 'j:', j, '\n'))
        cat(c("w_wsd_data$Data[i]:", w_wsd_data$Data[i + 1][ , 1], '\n', 
              'w_wsd_data$Data[j]:', w_wsd_data$Data[j + 1][ , 1], '\n'))
        stop('Null timeseries in find_corr_delta_t_matrix.R')
      }
      else {
        #else proceed with correlation calculation
        lst_ccf = ccf(w_wsd_data$Data[i + 1][ , 1],
                      w_wsd_data$Data[j + 1][ , 1],
                      max_delta_t, 
                      plot = F)
        mat_ccor[i, j] = max(lst_ccf$acf)
        for (m in lst_ccf$lag) {
          if (lst_ccf[m]$acf == mat_ccor[i, j]) {
            mat_dt[i, j] = lst_ccf[m]$lag
            break
          }
        }
        
      }
    }
  }
  
  return(list(mat_ccor, mat_dt))
}

