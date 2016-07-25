#dt_run
#Yu Gui
#China Asset Management Co.
#7/25/2016

#define parameters
str_idx = 'pri' #'pri' for Wind primary industry index, 'scd' for Wind secondary industry index
max_dt = 100 #maximum time delay between two timeseries


#run the whole process

#get data
print('Getting data...')
w_wsd_data = get_data(str_idx)
print('Done')

#calc corr_dt_matrix
print('Calculating corr_dt_matrix...')
corr_dt_matrix = find_corr_delta_t_matrix(w_wsd_data, max_dt, str_idx)
print('Done')
#write the matrix to csv
str_csv_name = paste('./result/corr_dt_matrix_', str_idx, max_dt, '.csv', sep = '')
write.csv(corr_dt_matrix, str_csv_name)
print(paste('Written to CSV:', str_csv_name))
