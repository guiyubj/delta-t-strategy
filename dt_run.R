#dt run
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#7/25/2016

#define parameters
str_idx = 'pri' #'pri' for SYWG primary industry index, 'scd' for SYWG secondary industry index, 'wpri' for Wind industry index, 'wscd' for Wind secondary industry index

fastMA = 10
slowMA = 360

min_dt = 20
max_dt = 500 #maximum time lag between two timeseries

min_ccor = 0.5


#run the whole process

#get data
print('Getting data...')
wsd_data = get_data(str_idx)$Data
hs300_data = get_data('hs300')$Data
excess_return_data = calc_excess_return_MAD(wsd_data, hs300_data, 
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
print(paste('mat_ccor_dt written to CSV:', str_csv_name))

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
                     str_idx,
                     '_min_ccor_', min_ccor, 
                     '_min_dt_', min_dt, '_max_dt_', max_dt, 
                     '_fast_', fastMA, '_slow_', slowMA, 
                     '.csv', sep = '')
write.csv(mat_tradable, str_csv_name)
print(paste('mat_tradable written to CSV:', str_csv_name))

#write trading pairs list to txt
str_txt_name = paste('./trading_pairs/vec_trading_pairs_', 
                     str_idx,
                     '_min_ccor_', min_ccor, 
                     '_min_dt_', min_dt, '_max_dt_', max_dt, 
                     '_fast_', fastMA, '_slow_', slowMA, 
                     '.txt', sep = '')
write(vec_trading_pairs, str_txt_name)
print(paste('lst_trading_pairs written to txt:', str_txt_name))


#calc follower list
lst_follower = calc_follower_list(mat_ccor, mat_dt, mat_tradable)

#write follower list to txt
str_txt_name = paste('./trading_pairs/lst_follower/lst_follower_', 
                     str_idx,
                     '_min_ccor_', min_ccor, 
                     '_min_dt_', min_dt, '_max_dt_', max_dt, 
                     '_fast_', fastMA, '_slow_', slowMA, 
                     '.json', sep = '')
list.save(lst_follower, str_txt_name)
print(paste('lst_follower written to json:', str_txt_name))

