
#write the matrices to csv
str_csv_name = paste('./ccor_dt_matrix/ccor_dt_matrix_', 
                     str_idx, '_dt', max_dt, '_fast', fastMA, '_slow', slowMA, 
                     '.csv', sep = '')
write.csv(lst_mat_ccor_dt, str_csv_name)
print(paste('Written to CSV:', str_csv_name))


