#test_calc_excess_return
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/27/2016


#define parameters
str_idx = 'pri' #'pri' for SYWG primary industry index, 'scd' for SYWG secondary industry index, 'wpri' for Wind industry index, 'wscd' for Wind secondary industry index

fastMA = 10
slowMA = 360

#run the whole process

#get data
print('Getting data...')
vec_idx_code = get_industry_index_list(str_idx)
w_wsd_data = get_data(str_idx)$Data
w_hs300_data = get_data('hs300')$Data
excess_return_data = calc_excess_return_MAD(w_wsd_data, w_hs300_data, 
                                            fastMA, slowMA)
print('Done')

print('Drawing plots of excess returns...')
for (i in c(2:length(excess_return_data))){
  str_plot_name = paste('./excess_return_MAD_plot/', 
                        'fast', fastMA, '_slow', slowMA, '/', 
                        'excess_return_MAD', 
                        '_f', fastMA, '_s', slowMA, '_', 
                        names(excess_return_data[i]), '.jpg', sep = '')
  jpeg(str_plot_name, width = 1024, height = 768)
  plot(excess_return_data[[1]], 
       excess_return_data[[i]], type = 'l', 
       main = paste(names(excess_return_data[i]), 
                    '_f', fastMA, '_s', slowMA))
  dev.off()
}
print('Done')

