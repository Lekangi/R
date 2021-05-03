library(nycflights13)
library(tidyverse)
select(flights, contains("TIME"))
by_day <- group_by(flights, year, month,day)# grouped year month and day and assigned to a variable
summarise(by_day, delay= mean(dep_delay,na.rm= TRUE))# summarised the groups and the delay input.
#summarise function is used when we want to collapse a data frame into a single row
#we can use summarise to compute new variables to the data frame
#COMBINING MULTIPLE OPERATIONS BY PIPE
delays <- flights %>% # we select a data frame flights
 group_by(dest)%>% # grouped the data by dest and then
 summarise( # summarised the data
  count = n(), # calculate number of flights
  dist = mean(distance, na.rm= TRUE), # calculate the average dist
  delay = mean(arr_delay, na.rm = TRUE) #calculate the average arr_delay
) %>%
filter(delay, count >20, dest != "HNL") # we then filtered the data by adding random noise
!is.na("dep_delay")
!is.na("arr_delay")
#counts helps count the number of occurrences and check that am not drawing conclusions
based on a small number of data
not_cancelled <- flights %>%  # selected a data frame
  filter(!is.na(dep_delay), !is.na(arr_delay)) #removed missing values from the data
frame
not_cancelled %>% 
  group_by(year, month, day) %>%  # grouped by the year,month and day
  summarise(mean = mean(dep_delay)) # summarised the dep_delay

delays <- not_cancelled %>% # assigned not_cancelled variable to delays function
 group_by(tailnum) %>% # we grouped by tailnumbers
 summarise( #we then summarised the data
 delay = mean(arr_delay) # we calculated the average delay to get the number of planes
that have the highest delay
)
ggplot(data=delays, mapping=aes(x=delay))+ # we then plotted the data
 geom_freqpoly(binwidth = 10)# used a geom_poly function
# draw a scatterplot of number of flights vs average delay
delays <- not_cancelled %>%
 group_by(tailnum) %>%
 summarise(# summarised the data set
  delay = mean(arr_delay, na.rm=TRUE) #to get average delay 
  n = n() # number of flights
)
ggplot(data=delays, mapping=aes(x=delay,y=n))+ # plotted number of flights vs average delay
 geom_point(alpha=1/10)
#we can use filter function to remove extreme variation in the smallest groups
daily <- group_by(flights,year,month,day)
daily %>%
 ungroup() %>% # we ungrouped the daily vector
 summarise(
 flights = n())