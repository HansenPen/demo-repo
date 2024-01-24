clear
import delimited "/Users/hansenpen/Desktop/codes/Solar_Panel_Project/regression/aggregate-with-waiting.csv"
gen outsideshare = 1 - marketshare
gen logmarketshare = log(marketshare)
gen logoutsideshare = log(outsideshare)
drop if missing(logoutsideshare)
drop if missing(logmarketshare)
gen sy = logmarketshare - logoutsideshare
regress sy average_total_cost 
gen logbase = log(totalinstalledbase)
regress sy average_total_cost logbase
regress sy average_total_cost logbase waiting_time


regress sy averagecostperkwh 
regress sy averagecostperkwh logbase
regress sy averagecostperkwh logbase waiting_time
