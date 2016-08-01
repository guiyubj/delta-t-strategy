#dt_run
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/25/2016

#define parameters
str_idx = 'pri' #'pri' for SYWG primary industry index, 'scd' for SYWG secondary industry index, 'wpri' for Wind industry index, 'wscd' for Wind secondary industry index
max_dt = 200 #maximum time delay between two timeseries

fastMA = 10
slowMA = 360

min_ccor = 0.5
min_dt = 3
max_dt = 300


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
#extract cross-correlation matrixs
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

#calc trading pairs
print('Calculating trading pairs...')
lst_calc_trading_pairs_return = calc_trading_pairs(mat_ccor, mat_dt, 
                                                   min_ccor, min_dt, max_dt)
mat_tradable = lst_calc_trading_pairs_return[[1]]
vec_trading_pairs = lst_calc_trading_pairs_return[[2]]
lst_trading_pairs_code = lst_calc_trading_pairs_return[[3]]
print('Done')

#write tradable matrix to CSV
str_csv_name = paste('./trading_pairs/mat_tradable_', 
                     str_idx, '_dt', max_dt, '_fast', fastMA, '_slow', slowMA, 
                     '.csv', sep = '')
write.csv(mat_tradable, str_csv_name)
print(paste('Written to CSV:', str_csv_name))

#write trading pairs list to txt
str_txt_name = paste('./trading_pairs/vec_trading_pairs_', 
                     str_idx, '_dt', max_dt, '_fast', fastMA, '_slow', slowMA, 
                     '.txt', sep = '')
write(vec_trading_pairs, str_txt_name)
print(paste('Written to CSV:', str_txt_name))


#draw comparision plots
print('Drawing comparision plots...')
counter = 1
for (i in lst_trading_pairs_code){
  str_plot_dir = paste('./comparision_plot/',
                       'fast', fastMA, '_slow', slowMA, 
                       sep = '')
  dir.create(str_plot_dir, showWarnings = FALSE)
  str_plot_name = paste(str_plot_dir, '/', 
                        'excess_return_MAD',
                        '_f', fastMA, '_s', slowMA, '_',
                        counter, '.jpg', sep = '')
  jpeg(str_plot_name, width = 1024, height = 768)
  plot(excess_return_data$Data[[1]],
       excess_return_data$Data[[i[[1]] + 1]],
       type = 'l', col = 'red',
       main = paste(names(excess_return_data$Data[i[[1]] + 1]), 'red', 
                    names(excess_return_data$Data[i[[2]] + 1]), 'blue', 
                    '_f', fastMA, '_s', slowMA))
  lines(excess_return_data$Data[[1]],
        excess_return_data$Data[[i[[2]] + 1]],
        col = 'blue')
  dev.off()
  counter = counter + 1
}
print('Done')

