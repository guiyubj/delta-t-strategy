#calculate excess return
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/26/2016

#function: calculate Moving Average Divergence as excess return
#w_wsd_data: data frame contains close prices time series of each industry
#w_hs300_data: shanghai & shenzhen 300 select index close time series data
#fastMA: fast moving average period (1 - 14 days), to filter near-term noise, e.g. bulk sell-off at the date
#slowMA: slow moving average period (180 - 720 days), to filter long-term structural trend, e.g. tech sector and service sector are taking on more profitability yoy, and they are going to continue doing so; thus, the long-term trend of profitability shell not be considered as a result of economic phases
#fastMA - slowMA: the remaining information (not filtered by both filters) is the effect of current economic phase on the industries
#return: a data frame of excess return for each industry
calc_excess_return_MAD <- function(w_wsd_data, w_hs300_data, fastMA, slowMA) {
  #copy the dataframe
  return_ratio = w_wsd_data
  return_ratio_fastMA = w_wsd_data
  return_ratio_slowMA = w_wsd_data
  excess_return = w_wsd_data
  
  #calculate excess return for each data series
  for (i in c(2:length(w_wsd_data$Data))){
    return_ratio$Data[[i]] = w_wsd_data$Data[[i]] / w_hs300_data$Data[[2]]
    return_ratio_fastMA$Data[[i]] = SMA(return_ratio$Data[[i]], fastMA)
    return_ratio_slowMA$Data[[i]] = SMA(return_ratio$Data[[i]], slowMA)
    excess_return$Data[[i]] = (return_ratio_fastMA$Data[[i]] - 
                                 return_ratio_slowMA$Data[[i]])
    
  }
  
  return(excess_return)
}

#function: divide the index by market ratio to calculate index performance with respect to overall maerket
#w_wsd_data: data frame contains close prices time series of each industry
#w_hs300_data: shanghai & shenzhen 300 select index close time series data
#return: a data frame of index/market ratio for each industry
calc_return_market_ratio <- function(w_wsd_data, w_hs300_data) {
  #copy the dataframe
  return_ratio = w_wsd_data
  
  #calculate excess return for each data series
  len = length(w_wsd_data$Data)
  for (i in c(2:len)){
    #excess return = industry index / market index
    return_ratio[[i]] = w_wsd_data$Data[[i]] / w_hs300_data$Data[[2]]
  }
  return(return_ratio)
}
