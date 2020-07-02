

setwd("/Users/yiwenzhao/Desktop/R")
getwd()

movie <- read.csv("movie.csv")
head(movie)

is.data.frame(movie)

colnames(movie) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
a <- head(movie)
str(movie)

library(ggplot2)
qplot(data = a, 
      x = Genre, y = AudienceRating,
      colour = Year)
movie$Genre
movie$Year

#---------------------------------Aesthetics
library(ggplot2)
p <- ggplot(data = movie, aes(x = CriticRating, y = AudienceRating,
                         colour = Genre, size = BudgetMillions,
                         ))
# >> ------------------plotting with layers 

p
p + geom_line(size=1) + geom_point(size=2)

#>>--------------------overridding aes

q <- p + geom_point(aes(colour = BudgetMillions)) + xlab("Budget Millions $$$")
q
#>> -------------reduce size 

# ADD COLOR
library(ggplot2)
r <- ggplot(data = movie, aes(x = CriticRating, y = AudienceRating))
r + geom_point(colour = "green")

# mapping
r + geom_point(aes(size=BudgetMillions, colour = Genre))

#setting
r + geom_point(size=2, colour = "red")

#- --------------Histograms and Density charts

h <- ggplot(data = movie, aes(x = BudgetMillions))
h + geom_histogram(binwidth = 10)

#----------------------------adding colour by mapping

h + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

#---------------------------sometime my use density charts

s <- ggplot(data = movie, aes(x = BudgetMillions))
s + geom_density(aes(fill=Genre), position = "stack")

# >>=-----------statring layer tips

t <- ggplot(data = movie)
t + geom_histogram(aes(x = AudienceRating),
                   binwidth = 10,
                   fill = "Black", colour = "White")

t + geom_histogram(aes(x = CriticRating),
                   binwidth = 10,
                   fill = "Black", colour = "White")

#>>----------------------------------Statistical Transformations

u <- ggplot(data = movie,
            aes(x = CriticRating, y = AudienceRating, 
            colour = Genre))

u + geom_point(size = 1) + geom_smooth(fill=NA)


#>>>-----------------------AudienceRating boxplots

y <- ggplot(data = movie, aes(x = Genre, y = AudienceRating, colour = Genre))
y + geom_boxplot(size = 1.2, alpha = 0.5) + geom_jitter()

#>>>-----------------------CriticRating boxplots
e <- ggplot(data = movie, aes(x = Genre, y = CriticRating, colour = Genre))
e + geom_boxplot(size = 1.2, alpha = 0.5) + geom_jitter()

#>>>>-------------------------using facts

v <- ggplot(data = movie, aes(x = BudgetMillions))

# facets
v + geom_histogram(binwidth = 10, aes(fill = Genre), 
                   colour = "Black") +
  facet_grid(Genre~., scales = "free")

# >>-----------------scatterplots

w <- ggplot(data = movie, aes(x = CriticRating, y = AudienceRating, colour = Genre))

# facets
w + geom_point(size = 3) +
  facet_grid(Genre~.)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)















