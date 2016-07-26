#dt_start
#Yu Gui
#China Asset Management Co.
#7/21/2016

#get data from Wind
library(WindR)
w.start()
cat('Connection status:', w.isconnected(), '\n')
source('./get_Wind_data.R')

#import functions
source('./calc_excess_return.R')
source('./find_corr_delta_t_matrix.R')

# print('Getting data...')
# w_wsd_data = get_data()
# print('Done')


