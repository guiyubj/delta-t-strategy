#get_Wind_data
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/20/2016

#function: generate a vector of industry index codes
#return: a vector of industry index codes
get_industry_index_list <- function(str_idx = 'pri') {
  #SYWG idx
  if (str_idx == 'pri') {
    #generate vector of primary index codes
    vec_pri_idx_code = c(
      '801010.SI',
      '801020.SI',
      '801030.SI',
      '801040.SI',
      '801050.SI',
      '801080.SI',
      '801110.SI',
      '801120.SI',
      '801130.SI',
      '801140.SI',
      '801150.SI',
      '801160.SI',
      '801170.SI',
      '801180.SI',
      '801200.SI',
      '801210.SI',
      '801230.SI',
      '801710.SI',
      '801720.SI',
      '801730.SI',
      '801740.SI',
      '801750.SI',
      '801760.SI',
      '801770.SI',
      '801780.SI',
      '801790.SI',
      '801880.SI',
      '801890.SI'
    )
    
    #TODO: UTF8 characters not supported in R
    # vec_pri_idx_name = c(
    #   "农林牧渔(申万)", 
    #   "采掘(申万)", 
    #   "化工(申万)", 
    #   "钢铁(申万)", 
    #   "有色金属(申万)", 
    #   "电子(申万)", 
    #   "家用电器(申万)", 
    #   "食品饮料(申万)", 
    #   "纺织服装(申万)", 
    #   "轻工制造(申万)", 
    #   "医药生物(申万)", 
    #   "公用事业(申万)", 
    #   "交通运输(申万)", 
    #   "房地产(申万)", 
    #   "商业贸易(申万)", 
    #   "休闲服务(申万)", 
    #   "综合(申万)", 
    #   "建筑材料(申万)", 
    #   "建筑装饰(申万)", 
    #   "电气设备(申万)", 
    #   "国防军工(申万)", 
    #   "计算机(申万)", 
    #   "传媒(申万)", 
    #   "通信(申万)", 
    #   "银行(申万)", 
    #   "非银金融(申万)", 
    #   "汽车(申万)", 
    #   "机械设备(申万)"
    # )
    
    return(vec_pri_idx_code)
  }
  
  if (str_idx == 'scd') {
    #generate vector of secondary index codes
    vec_scd_idx_code = c(
      '801011.SI',
      '801012.SI',
      '801013.SI',
      '801014.SI',
      '801015.SI',
      '801016.SI',
      '801017.SI',
      '801018.SI',
      '801021.SI',
      '801022.SI',
      '801023.SI',
      '801024.SI',
      '801032.SI',
      '801033.SI',
      '801034.SI',
      '801035.SI',
      '801036.SI',
      '801037.SI',
      '801041.SI',
      '801051.SI',
      '801053.SI',
      '801054.SI',
      '801055.SI',
      '801072.SI',
      '801073.SI',
      '801074.SI',
      '801075.SI',
      '801076.SI',
      '801081.SI',
      '801082.SI',
      '801083.SI',
      '801084.SI',
      '801085.SI',
      '801092.SI',
      '801093.SI',
      '801094.SI',
      '801101.SI',
      '801102.SI',
      '801111.SI',
      '801112.SI',
      '801123.SI',
      '801124.SI',
      '801131.SI',
      '801132.SI',
      '801141.SI',
      '801142.SI',
      '801143.SI',
      '801144.SI',
      '801151.SI',
      '801152.SI',
      '801153.SI',
      '801154.SI',
      '801155.SI',
      '801156.SI',
      '801161.SI',
      '801162.SI',
      '801163.SI',
      '801164.SI',
      '801171.SI',
      '801172.SI',
      '801173.SI',
      '801174.SI',
      '801175.SI',
      '801176.SI',
      '801177.SI',
      '801178.SI',
      '801181.SI',
      '801182.SI',
      '801191.SI',
      '801192.SI',
      '801193.SI',
      '801194.SI',
      '801202.SI',
      '801203.SI',
      '801204.SI',
      '801205.SI',
      '801211.SI',
      '801212.SI',
      '801213.SI',
      '801214.SI',
      '801215.SI',
      '801222.SI',
      '801223.SI',
      '801231.SI',
      '801711.SI',
      '801712.SI',
      '801713.SI',
      '801721.SI',
      '801722.SI',
      '801723.SI',
      '801724.SI',
      '801725.SI',
      '801731.SI',
      '801732.SI',
      '801733.SI',
      '801734.SI',
      '801741.SI',
      '801742.SI',
      '801743.SI',
      '801744.SI',
      '801751.SI',
      '801752.SI',
      '801761.SI',
      '801881.SI'
    )
    return(vec_scd_idx_code)
  }
  
  #Wind idx
  if (str_idx == 'wpri') {
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
  
  if (str_idx == 'wscd') {
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
  if(idx == 'sh') {
    w_wsd_data<-w.wsd("000001.SH","close","ED-10Y","2016-07-20","Fill=Previous")
  }
  else if(idx == 'hs300') {
    w_wsd_data<-w.wsd("000300.SH","close","ED-10Y","2016-07-20","Fill=Previous")
  }
  else {
    vec_idx_code = get_industry_index_list(idx)
    w_wsd_data<-w.wsd(paste(vec_idx_code, sep = ','),
                      "close","ED-10Y","2016-07-20","Fill=Previous")
  }
  return(w_wsd_data)
}


