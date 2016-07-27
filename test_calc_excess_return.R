#test_calc_excess_return
#Yu Gui
#China Asset Management Co.
#7/27/2016


#define parameters
str_idx = 'pri' #'pri' for Wind primary industry index, 'scd' for Wind secondary industry index
max_dt = 100 #maximum time delay between two timeseries


#run the whole process

#get data
print('Getting data...')
vec_idx_code = get_industry_index_list(str_idx)
w_wsd_data = get_data(str_idx)
w_sh_data = get_data('sh')
excess_return_data = get_excess_return(w_wsd_data, w_sh_data)
# excess_return_data = get_excess_return_market_ratio(w_wsd_data, w_sh_data)
print('Done')

