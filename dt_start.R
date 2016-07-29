#dt_start
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
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
source('./calc_trading_pairs.R')

#import test functions

# print('Getting data...')
# w_wsd_data = get_data()
# print('Done')


