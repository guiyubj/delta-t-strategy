calc_excess_return_market_ratio <- function(w_wsd_data, w_sh_data) {
  #copy the dataframe
  excess_return_ratio = w_wsd_data
  excess_return_ratio_SMA = w_wsd_data
  delta_excess_return = w_wsd_data
  
  #calculate excess return for each data series
  len = length(w_wsd_data$Data)
  for (i in c(2:len)){
    #excess return = industry index / market index
    w_wsd_data$Data[i] = w_wsd_data$Data[i] / w_sh_data$Data[2]
  }
  return(w_wsd_data)
}
