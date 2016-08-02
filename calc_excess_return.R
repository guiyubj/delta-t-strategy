#calculate excess return
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/26/2016

#function: calculate Moving Average Divergence as excess return
#wsd_data: data frame contains close prices time series of each industry
#w_hs300_data: shanghai & shenzhen 300 select index close time series data
#fastMA: fast moving average period (1 - 14 days), to filter near-term noise, e.g. bulk sell-off at the date
#slowMA: slow moving average period (180 - 720 days), to filter long-term structural trend, e.g. tech sector and service sector are taking on more profitability yoy, and they are going to continue doing so; thus, the long-term trend of profitability shell not be considered as a result of economic phases
#fastMA - slowMA: the remaining information (not filtered by both filters) is the effect of current economic phase on the industries
#return: a data frame of excess return for each industry
calc_excess_return_MAD <- function(wsd_data, w_hs300_data, fastMA, slowMA) {
  #copy the dataframe
  return_ratio = wsd_data
  return_ratio_fastMA = wsd_data
  return_ratio_slowMA = wsd_data
  excess_return = wsd_data
  
  #calculate excess return for each data series
  for (i in c(2:length(wsd_data))){
    return_ratio[[i]] = wsd_data[[i]] / w_hs300_data[[2]]
    return_ratio_fastMA[[i]] = SMA(return_ratio[[i]], fastMA)
    return_ratio_slowMA[[i]] = SMA(return_ratio[[i]], slowMA)
    excess_return[[i]] = (return_ratio_fastMA[[i]] - 
                                 return_ratio_slowMA[[i]])
    
  }
  
  return(excess_return)
}

#function: divide the index by market ratio to calculate index performance with respect to overall maerket
#wsd_data: data frame contains close prices time series of each industry
#w_hs300_data: shanghai & shenzhen 300 select index close time series data
#return: a data frame of index/market ratio for each industry
calc_return_market_ratio <- function(wsd_data, w_hs300_data) {
  #copy the dataframe
  return_ratio = wsd_data
  
  #calculate excess return for each data series
  len = length(wsd_data)
  for (i in c(2:len)){
    #excess return = industry index / market index
    return_ratio[[i]] = wsd_data[[i]] / w_hs300_data[[2]]
  }
  return(return_ratio)
}
