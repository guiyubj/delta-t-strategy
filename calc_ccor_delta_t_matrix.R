#calc_ccor_delta_t_matrix
#Yu Gui
#China Asset Management Co.
#7/21/2016

#function: calc the correlation-(delta-t) matrix
#w_wsd_data: data with Wind API data format
#max_dt: maximum lag time to be claculated
#(delta_t needs to be limited to a practical range)
#(if the delta_t to achieve the highest correlation is too long, it becomes meaningless)
calc_ccor_delta_t_matrix <- function(w_wsd_data, max_dt = 180) {
  #define max_delta_t
  max_delta_t = max_dt
  
  #get data
  vec_idx_code = names(w_wsd_data$Data)[2:length(w_wsd_data$Data)]
  vec_date = w_wsd_data$Data$DATETIME
  
  #create a empty matrix to store cross-correlation
  mat_ccor = matrix(nrow = (length(w_wsd_data$Data) - 1), 
                    ncol = (length(w_wsd_data$Data) - 1), 
                    dimnames = list(vec_idx_code, vec_idx_code))
  #create a empty matrix to store delta-t
  mat_dt = mat_ccor
  cat(c('Dim of the correlation matrix:', dim(mat_ccor), '\n'))
  
  #start calculate ccor and delta-t using function ccf()
  #traverse through both matrices and fill them with calculated result
  for (i in c(1 : length(mat_ccor[1, ]))) {
    for (j in c(1 : length(mat_ccor[, 1]))) {
      
      if (is.null(w_wsd_data$Data[[i + 1]]) || 
          is.null(w_wsd_data$Data[[j + 1]])) { #data validation
        #if one of the timeseries is NULL, stop and report error
        cat(c("i:", i, '\n', 'j:', j, '\n'))
        cat(c("w_wsd_data$Data[i]:", w_wsd_data$Data[[i + 1]], '\n', 
              'w_wsd_data$Data[j]:', w_wsd_data$Data[[j + 1]], '\n'))
        stop('Null timeseries in calc_ccor_delta_t_matrix.R')
      }
      else {
        #else proceed with correlation calculation
        #calculate cross-correlation
        lst_ccf = ccf(w_wsd_data$Data[[i + 1]],
                      w_wsd_data$Data[[j + 1]],
                      max_delta_t, 
                      plot = F)
        mat_ccor[i, j] = max(lst_ccf$acf)
        
        #find delta-t with highest ccor
        for (m in c(1:length(lst_ccf$acf))) {
          if (lst_ccf$acf[m] == mat_ccor[i, j]) {
            mat_dt[i, j] = lst_ccf$lag[m]
            break
          }
        }
        
      }
    }
  }
  
  return(list(mat_ccor, mat_dt))
}

