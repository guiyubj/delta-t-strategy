#dt_start
#Yu Gui
#China Asset Management Co.
#7/21/2016

#get data from Wind
library(WindR)
library(TTR)
w.start()
cat('Connection status:', w.isconnected(), '\n')
source('./get_Wind_data.R')

#import functions
source('./calc_excess_return.R')
source('./calc_ccor_delta_t_matrix.R')

#import test functions
# source('./test_calc_excess_return.R')

# print('Getting data...')
# w_wsd_data = get_data()
# print('Done')


