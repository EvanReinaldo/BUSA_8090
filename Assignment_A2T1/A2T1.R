library(tidyverse)
library(ggplot2)

covid_data = read_csv(file="D:/owid-covid-data.csv")

head(covid_data)

covid25april_data = covid_data %>%  #i take 25 april 2020 data as in Question data
  filter(date=="2020-04-25")

covidcountry = covid25april_data %>%
  filter(location =="Australia" | location == "Germany" | location == "Belgium" | location == "Spain" | location == "Italy" | location == "France"| location == "Netherlands") %>%
# i use 7 countries for the graphic

covidcountry %>%
  mutate(location = fct_reorder(location, new_deaths_per_million)) %>% #to reorder by higher new_deaths_per_million first
  ggplot(aes(location, new_deaths_per_million)) +  #plotting the square map
  geom_bar(stat="identity", width=0.5, fill = "#4285F4") + coord_flip()+ #include the bar chart and coord_flip to make it horizontal and give color
  ggtitle("Covid-19 New Death per 1 million")+ #giving the title on the middle
  scale_y_continuous(position = "right")+ #moving the y axis(0,5,10,15) to the right, in this occasion on top because i use coord_flip
  labs(y=NULL) #removing the y axis label 
  
