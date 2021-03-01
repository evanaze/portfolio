library(ggplot2)
library(plyr)
library(dplyr)
library(data.table)
library(ggmap)

### Set working directory
directory <- "/Users/Shon/Documents/College/PSTAT 193"
setwd(directory)

### Read data
SATdata <- read.csv("scores.csv")

### Get NY map data
NYmap <- get_map(location = c(lon = mean(SATdata$Longitude), lat = mean(SATdata$Latitude)), 
                 zoom = 10, maptype = "roadmap", color = "bw") 

ggmap(NYmap)+ 
          labs(title = "New York City Map",
               x = "Longitude",
               y = "Latitude")

### Plot of School locations
Schoolplot <- ggmap(NYmap) + 
              geom_point(aes(x = SATdata$Longitude, 
                             y = SATdata$Latitude), 
                         data = SATdata) + 
              labs(title = "Plot of School Locations", 
                   x = "Longitude",
                   y = "Latitude")

Schoolplot


### Plot of school locations with SAT scores
#Remove schools with missing SAT scores
SATclean <- subset(SATdata, subset = Average.Score..SAT.Math. > 0)

#Calculate total SAT score
SATtotal <- SATclean$Average.Score..SAT.Math. + 
                 SATclean$Average.Score..SAT.Reading. + 
                 SATclean$Average.Score..SAT.Writing.
#Add row of total scores to SATclean
SATclean <- mutate(SATclean, SATtotal)
SATclean$SATtotal <- as.numeric(SATclean$SATtotal)

#Plot Schools with SAT score scale
Schoolplot2 <- ggmap(NYmap) + 
  geom_point(aes(x = SATclean$Longitude, 
                 y = SATclean$Latitude,
                 color = SATclean$SATtotal),
             size = 3, 
             alpha = .7,
             data = SATclean) + 
  labs(title = "Plot of School Locations with Average Total SAT Scores", 
       x = "Longitude",
       y = "Latitude",
       color = "Average Total SAT Score")
  

Schoolplot2


### Bar graph of boroughs vs total SAT scores
Boroughs.Scores <- SATclean %>%
                  group_by(Borough) %>%
                  summarise(mean_score = mean(SATtotal))


head(Boroughs.Scores)

Boroughs.scores.bar <- ggplot(Boroughs.Scores, 
                              aes(Borough, mean_score, fill = Borough)) + 
                        geom_col() + 
                        theme(legend.position = "none") + 
                        scale_fill_manual(values = c(rep("turquoise4", length(Boroughs.Scores$Borough)))) + 
                        labs(title = "Boroughs vs Average SAT Scores",
                             y = "Average SAT Scores")

Boroughs.scores.bar

###Plot of school locations with respect to boroughs
SATdata

Schoolplot3 <- ggmap(NYmap) + 
  geom_point(aes(x = SATdata$Longitude, 
                 y = SATdata$Latitude,
                 colour = factor(SATdata$Borough)), 
             data = SATdata) + 
  labs(title = "Plot of School Locations", 
       x = "Longitude",
       y = "Latitude",
       colour = "Boroughs")

Schoolplot3


