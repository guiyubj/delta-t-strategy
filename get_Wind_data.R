#get_Wind_data
#Yu Gui
#China Asset Management Co.
#7/20/2016

#function: generate a vector of industry index codes
#return: a vector of industry index codes
get_industry_index_list <- function(str_idx = 'scd') {
  if (str_idx == 'pri') {
    #generate vector of primary index codes
    vec_pri_idx_code = c(
      '882001.WI',
      '882002.WI',
      '882003.WI',
      '882004.WI',
      '882005.WI',
      '882006.WI',
      '882007.WI',
      '882008.WI',
      '882009.WI',
      '882010.WI'
    )
    return(vec_pri_idx_code)
  }
  
  if (str_idx == 'scd') {
    #generate vector of secondary index codes
    vec_scd_idx_code = c(
      '882100.WI',
      '882101.WI',
      '882102.WI',
      '882103.WI',
      '882104.WI',
      '882105.WI',
      '882106.WI',
      '882107.WI',
      '882108.WI',
      '882109.WI',
      '882110.WI',
      '882111.WI',
      '882112.WI',
      '882113.WI',
      '882114.WI',
      '882115.WI',
      '882116.WI',
      '882117.WI',
      '882118.WI',
      '882119.WI',
      '882120.WI',
      '882121.WI',
      '882122.WI',
      '882123.WI'
    )
    return(vec_scd_idx_code)
  }
}

#function: get data from Wind Terminal
#library WindR must be loaded and w.isconnected() must return True for this function to work properly
get_data <- function(idx = 'scd') {
  vec_idx_code = get_industry_index_list(idx)
  w_wsd_data<-w.wsd(paste(vec_idx_code, sep = ','),"close","ED-10Y","2016-07-20","Fill=Previous")
  return(w_wsd_data)
}



