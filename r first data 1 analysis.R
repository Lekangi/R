library(tidyverse)
getwd()
netflix <- read.csv("C:/Users/dell 7404/Desktop/R/projects/netflix_titles.csv")
glimpse(netflix)
netflix
summary(neflix)
table(neflix$type)#used the table function to creeate a tabular representation of type column
netflix %>% #called the data frame netflix
  count(type) %>% #counted the number data in the column type
  ggplot(aes(x = type, y = n, fill = type)) + geom_col() +#plotted columns for the data set
  labs(tittle = "Show types", 
       subtitle = "Netflix Data",
       caption = 'Data source : Kaggle')+
  theme_grey()
table(netflix$rating)
netflix %>% 
  count(rating) %>%
  ggplot() + geom_col(aes(x = rating, y = n, fill = rating)) +
  coord_flip()
netflix %>% 
  filter(country == "Kenya") %>%
  count()
#mean duration of movies
netflix %>%
  filter(type == 'Movie') %>%
  mutate(movie_duration =parse_number(duration)) %>%
  summarise(mean_duration = mean(movie_duration))
table(netflix$country)
#Distribution of countries

netflix %>% #called the data set 
  filter(!str_detect(country, ',')) %>% #used str_detect to find the pattern in country that has countries which are separated with a comma and then we negate it to find countries that are not separated by comma
  group_by(country) %>%
  count() %>%
  arrange(desc(n))%>%
  head(20) %>%
  ggplot() + geom_col(aes(y = country, x = n))
netflix %>%
  filter(!str_detect(country, ',')) %>%
  group_by(country) %>%
  count() %>%
  filter(n < 1) %>%
  head(20) %>%
  ggplot() +geom_col(aes(y = country, x = n))
netflix %>%
  filter(country == "Italy") %>%
  count()
  