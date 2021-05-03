library(tidyverse)
library(nycflights13)
head(flights)
print(flights, n = 10, width = Inf)
help("flights")
flights %>%
  filter(arr_delay >= 120) %>%
  count()
flights %>%
  filter(dest == "IAH" | dest == "HOU")
flights %>%
  filter(dest %in% c("IAH","HOU"))
airlines
flights %>%
  filter(carrier %in% c("UA","AA","DL")) %>%
  print(n = 10, width = Inf)
flights %>%
  filter(month %in% 7:9)
flights %>%
  filter(arr_delay >= 120 , dep_delay <= 0 )
flights %>%
  filter(dep_delay <= 60, dep_delay - arr_delay > 30)
flights %>%
  filter(dep_time <= 600 | dep_time == 2400)
flights %>%
  filter(is.na()) %>%
  arrange()
flights %>%
  arrange(desc(dep_delay))
