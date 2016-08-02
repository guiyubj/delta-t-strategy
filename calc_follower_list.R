#calculate followers of industries
#Yu Gui
#China Asset Management Co.
#Quantitative Investment Division
#8/2/2016

#function: calculate the follower lists for each industry
#(followers are industries that move in the same way as the subject industry)
#(but the movements of follwers are usually lagged)
calc_follower_list <- function (mat_ccor, mat_dt, mat_tradable) {
  lst_follower = list()
  
  for (i in c(1:length(mat_tradable[1, ]))) {
    lst_follower[[names(mat_tradable[1, ][i])]] = list()
    for (j in c(1:length(mat_tradable[ , 1]))) {
      #constraint requirement for a trading pair to be practical
      if (mat_tradable[j, i] == T) {
        lst_follower[[i]] = c(lst_follower[[i]], names(mat_tradable[ , 1][j]))
      }
    }
  }
  
  return(lst_follower)
}

