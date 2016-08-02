#calc_ccor_delta_t_matrix
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/21/2016

#function: calc the correlation-(delta-t) matrix
#wsd_data: data with Wind API data format
#max_dt: maximum lag time to be claculated
#(delta_t needs to be limited to a practical range)
#(if the delta_t to achieve the highest correlation is too long, it becomes meaningless)
#return: a list of two matrix: (max ccor matrix, lag matrix)
calc_ccor_delta_t_matrix <- function(wsd_data, max_dt = 180) {
  #define max_delta_t
  max_delta_t = max_dt
  
  #get data
  vec_idx_code = names(wsd_data)[2:length(wsd_data)]
  vec_date = wsd_data$DATETIME
  
  #create a empty matrix to store cross-correlation
  mat_ccor = matrix(nrow = (length(wsd_data) - 1), 
                    ncol = (length(wsd_data) - 1), 
                    dimnames = list(vec_idx_code, vec_idx_code))
  #create a empty matrix to store delta-t
  mat_dt = mat_ccor
  cat(c('Dim of the correlation matrix:', dim(mat_ccor), '\n'))
  
  #start calculate ccor and delta-t using function ccf()
  #traverse through both matrices and fill them with calculated result
  for (i in c(1 : length(mat_ccor[1, ]))) {
    for (j in c(1 : length(mat_ccor[, 1]))) {
      
      if (is.null(wsd_data[[i + 1]]) || 
          is.null(wsd_data[[j + 1]])) { #data validation
        #if one of the timeseries is NULL, stop and report error
        cat(c("i:", i, '\n', 'j:', j, '\n'))
        cat(c("wsd_data[i]:", wsd_data[[i + 1]], '\n', 
              'wsd_data[j]:', wsd_data[[j + 1]], '\n'))
        stop('Null timeseries in calc_ccor_delta_t_matrix.R')
      }
      else {
        #else proceed with correlation calculation
        #calculate cross-correlation
        lst_ccf = ccf(wsd_data[[i + 1]],
                      wsd_data[[j + 1]],
                      max_delta_t, 
                      na.action = na.pass, 
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

