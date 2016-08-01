
#write the matrices to csv
str_csv_name = paste('./ccor_dt_matrix/ccor_dt_matrix_', 
                     str_idx, '_dt', max_dt, '_fast', fastMA, '_slow', slowMA, 
                     '.csv', sep = '')
write.csv(lst_mat_ccor_dt, str_csv_name)
print(paste('Written to CSV:', str_csv_name))


for (i in c(1:length(mat_ccor[1, ]))) {
  for (j in c(1:length(mat_ccor[ , 1]))) {
    #constraint requirement for a trading pair to be practical
    if ((mat_ccor[i,j] > MIN_CORR) & 
        (mat_dt[i, j] > MIN_DT) & 
        (mat_dt[i, j] < MAX_DT)) {
      print(mat_ccor[i, j])
      print(mat_dt[i, j])
      lst_trading_pairs = c(lst_trading_pairs, 
                            paste(names(mat_ccor[i, ]),
                                  names(mat_ccor[, j]))
      )
    }
  }
}