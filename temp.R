
calc_delayed_cor1 <- function(d_t) {
  cat('length of syb1:', length(data$Data$'882003.WI'[1:(length(data$Data$'882003.WI') - d_t)]), '\n')
  cat('length of syb1:', length(data$Data$'882001.WI'[(1 + d_t):length(data$Data$'882001.WI')]), '\n')
  correlation = 
    cor(data$Data$'882003.WI'[1:(length(data$Data$'882003.WI') - d_t)], 
        data$Data$'882001.WI'[(1 + d_t):length(data$Data$'882001.WI')])
  
  return(correlation)
}