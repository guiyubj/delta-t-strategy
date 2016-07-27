#calculate excess return
#Yu Gui
#China Asset Management Co.
#7/26/2016

get_excess_return <- function(w_wsd_data, w_sh_data) {
  #copy the dataframe
  excess_return_ratio = w_wsd_data
  excess_return_ratio_SMA = w_wsd_data
  delta_excess_return = w_wsd_data
  
  len = length(w_wsd_data$Data)
  for (i in 2:len){
    excess_return_ratio$Data[i] = w_wsd_data$Data[i] / w_sh_data$Data[2]
    excess_return_ratio_SMA$Data[i] = SMA(excess_return_ratio$Data[i])
    delta_excess_return$Data[i] = excess_return_ratio$Data[i] 
    - excess_return_ratio_SMA$Data[i]
    
  }
  return(delta_excess_return)
}

get_excess_return_market_ratio <- function(w_wsd_data, w_sh_data) {
  #copy the dataframe
  excess_return_ratio = w_wsd_data
  excess_return_ratio_SMA = w_wsd_data
  delta_excess_return = w_wsd_data
  
  len = length(w_wsd_data$Data)
  for (i in 2:len){
    w_wsd_data$Data[i] = w_wsd_data$Data[i] / w_sh_data$Data[2]
  }
  return(w_wsd_data)
}