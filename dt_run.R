#dt_run
#Yu Gui
#China Asset Management Co.
#7/25/2016

#define parameters
str_idx = 'pri' #'pri' for SYWG primary industry index, 'scd' for SYWG secondary industry index, 'wpri' for Wind industry index, 'wscd' for Wind secondary industry index
max_dt = 720 #maximum time delay between two timeseries

fastMA = 10
slowMA = 360

#run the whole process

#get data
print('Getting data...')
w_wsd_data = get_data(str_idx)
w_hs300_data = get_data('hs300')
excess_return_data = calc_excess_return_MAD(w_wsd_data, w_hs300_data, 
                                            fastMA, slowMA)
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
str_csv_name = paste('./ccor_dt_matrix/ccor_dt_matrix_', 
                     str_idx, '_dt', max_dt, '_fast', fastMA, '_slow', slowMA, 
                     '.csv', sep = '')
write.csv(lst_mat_ccor_dt, str_csv_name)
print(paste('Written to CSV:', str_csv_name))

