#two vectors of data
# monthly revenue
# monthly expenses

# prift for each month
# profit after tax each month (30%)
# profit margin a month profit after tax / revenue
#good profit af tax greater than mean for year
#bad profit after tax less than mean for year
#best month
#worst month
#all results as vectors


revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
profit <- revenue - expenses

tax <- round(profit*0.3, digits=2)
tax

taxprofit <- profit - tax
taxprofit

margin <- round((taxprofit/revenue)*100)
margin

mean(taxprofit)
taxprofit > mean(taxprofit)
taxprofit < mean(taxprofit)

max(taxprofit)
min(taxprofit)