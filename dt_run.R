#dt_run
#Yu Gui
#China Asset Management Co.
#7/25/2016

#define parameters
str_idx = 'scd' #'pri' for Wind primary industry index, 'scd' for Wind secondary industry index
max_dt = 100 #maximum time delay between two timeseries


#run the whole process

#get data
print('Getting data...')
w_wsd_data = get_data(str_idx)
w_sh_data = get_data('sh')
excess_return_data = calc_excess_return_market_ratio(w_wsd_data, w_sh_data)
print('Done')

#calc ccor_dt_matrix
print('Calculating ccor_dt_matrix...')
#get the list of cross-correlation matrix and delta-t matrix
lst_mat_ccor_dt = calc_ccor_delta_t_matrix(excess_return_data, max_dt)
#extract cross-correlation matrix
mat_ccor = lst_mat_ccor_dt[[1]]
#extract delta-t matrix
mat_dt = lst_mat_ccor_dt[[2]]

print('Done')
#write the matrices to csv
str_csv_name = paste('./result/ccor_dt_matrix_', str_idx, max_dt, '.csv', sep = '')
write.csv(lst_mat_ccor_dt, str_csv_name)
print(paste('Written to CSV:', str_csv_name))

