#calculate excess return
#Yu Gui
#China Asset Management Co.
#7/26/2016

calc_excess_return <- function(w_wsd_data, w_sh_data) {
  len = length(w_wsd_data$Data)
  for (i in 2:len){
    w_wsd_data$Data[i] = w_wsd_data$Data[i] / w_sh_data$Data[2]
  }
  return(w_wsd_data)
}