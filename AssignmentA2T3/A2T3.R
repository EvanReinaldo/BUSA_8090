library(tidyverse)

mi_counties <- map_data("county", "michigan") %>%
  select(lon = long, lat, group, id = subregion)

mi_counties

mi_census <- midwest %>%
  tbl_df() %>%
  filter(state =="MI") %>%
  mutate(county = tolower(county)) %>%
  select(county, area, poptotal, percwhite, percblack)

head(mi_counties)
head(mi_census)

census_counties <- left_join(mi_census, mi_counties, by = c("county" ="id"))
census_counties


dat_map$ccode = countrycode(dat_map$region,origin = "country.name",destination = "wb")

wdidata$ccode = countrycode(wdidata$country,origin="country.name",destination = "wb")

head(dat_map)
head(wdidata)

merged = full_join(dat_map,wdidata,by="ccode")

head(merged)

#question 2a
library("WDI")
WDIsearch("CO2.*capita")
CO2data = WDI(indicator = c("EN.ATM.CO2E.PC"),start=2010,end=2010,extra=TRUE)

library(maps)
dat_map = map_data("world")
library("countrycode")
dat_map$ccode = countrycode(dat_map$region,origin = "country.name",destination = "wb")
CO2data$ccode = countrycode(CO2data$country,origin="country.name",destination = "wb")
head(dat_map)
head(CO2data)
mergedCO2 = full_join(dat_map,CO2data,by="ccode")
mergedCO2 = mergedCO2 %>%
  rename(Emit_CO2percap=EN.ATM.CO2E.PC)
head(mergedCO2)

ggplot(mergedCO2,aes(x=long,y=lat,group=group,fill=log10(Emit_CO2percap)))+geom_polygon()

#question 2b
install.packages("devtools")
library(devtools)
install_github("DougLuke/UserNetR")
library(UserNetR)
data(Bali)
library(ggnetwork)

ggnetwork(Bali)

ggnetplot <- function(Net=Bali){
  Net <- ggnetwork(Net,layout="kamadakawai")
  (ggplot(Net, aes(x,y, xend=xend, yend=yend)) 
    + geom_edges(color="lightgrey") 
    + geom_nodes(alpha=0.2,size=3) 
    + geom_nodetext(aes(label=vertex.names),color="blue") 
    + geom_point() 
    + theme_blank())
}

ggnetplot()

ggnetroles <- function(Net=Bali){
  Net <- ggnetwork(Net,layout="kamadakawai")
  (ggplot(Net, aes(x,y, xend=xend, yend=yend)) 
    + geom_edges(color="lightgrey") 
    + geom_nodes(alpha=0.2,size=3) 
    + geom_nodetext(aes(label=role),color="blue") 
    + theme_blank())
}

ggnetroles()

