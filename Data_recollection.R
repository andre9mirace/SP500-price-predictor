# Assuming dplyr is installed and loaded
library(quantmod)
library(PerformanceAnalytics)
library(MASS)


getSymbols('^GSPC')

ferm = GSPC$GSPC.Close
Retruns = CalculateReturns(ferm)


date_index <- index(GSPC)

date_index_df <- data.frame(Date = date_index)

  # Combine the data frames
GSPC <- cbind(date_index_df, GSPC, Retruns)
 


colnames(GSPC) = c('Date','Open' ,'High' ,'Low' ,'Close' ,'Volume', 'Adjusted', 'Returns')
sp500_data <- GSPC

 write.csv(sp500_data, 'sp500_final_df.csv')
