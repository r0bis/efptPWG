# RK for me it works a bit better if files are not too long. 
## Plots deserve their own temporary file ;)
# Prepare training environment
setwd("~/src/efptPWG/data/Belgium")
source("./Belgium_R_syntax_file.R")
# now that we have data - go back to tmp
setwd("~/src/efptPWG/tmp")

# PIE charts in ggplot
# http://mathematicalcoffee.blogspot.co.uk/2014/06/ggpie-pie-graphs-in-ggplot2.html
library(ggplot2)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("gridExtra")
library(gridExtra)

# ggpie: draws a pie chart.
# give it:
# * `dat`: your dataframe
# * `by` {character}: the name of the fill column (factor)
# * `totals` {character}: the name of the column that tracks
#    the time spent per level of `by` (percentages work too).
# returns: a plot object.
ggpie <- function (dat, by, totals, plotTitle) {
  ggplot(dat, aes_string(x=factor(1), y=totals, fill=by)) +
    geom_bar(stat='identity', color='black', width=1) +
    guides(fill=guide_legend(override.aes=list(colour=NA))) + # removes black borders from legend
    coord_polar(theta='y') +
    ggtitle(plotTitle) +
    theme(axis.ticks=element_blank(),
          axis.text.y=element_blank(),
          axis.text.x=element_text(colour='black'),
          axis.title=element_blank()) +
    scale_y_continuous(breaks=cumsum(dat[[totals]]) - dat[[totals]] / 2, labels=dat[[by]])    
}

# use the function such as:
df <- as.data.frame(table(data$q_0001))
colnames(df) <- c("Sex","Number")
gp <- ggpie(df,'Sex','Number',"Distribution by Sex")
gp +  scale_fill_brewer(palette="YlGn")
gp

# Histograms in ggplot:

gb1 <- ggplot(data, aes(q_0002)) +geom_histogram(color="white")
gb1

gb2 <- ggplot(data, aes(q_0002, fill=..count..)) +geom_histogram(color="white")
gb2
gb2 +ggtitle("Age distribution") +scale_fill_brewer(palette="Set1")
gb2 +ggtitle("Age distribution") +scale_fill_brewer(palette="Set1")
gb21 <- gb2 +ggtitle("Age distribution") +scale_fill_continuous(trans = 'reverse', guide = guide_legend(title = "Nr."))
gb2 +ggtitle("Age distribution") +scale_fill_continuous()

gb21
gb21 + guides(colour = guide_legend(reverse=T)) +labs(x="Age", y="Count") +guide_legend(title="Cases")

 # if we really want to add density plot to it - just for fun; and rug
gb3 <- ggplot(data) 
  +geom_histogram(aes(q_0002,..density..))
  +geom_density(aes(q_0002,..density..)) 
  +geom_rug(aes(q_0002))

gb1 <- gb1 +ggtitle("Age distribution")
 # put them in one 
grid.arrange(gp,gb1,nrow=1)



```{r page_01, echo=FALSE, warning=FALSE, message=FALSE, eval=FALSE}
blank<-rectGrob(gp=gpar(col="white"))
grid.arrange(gg.sex,gg.YoT,blank,blank,gg.InTh,gg.age, heights=c(0.45,0.05,0.45),nrow=3, ncol=2, widths=c(0.45,0.55))
```

```{r pageBreak_01, echo=FALSE, results='asis', eval=FALSE}
cat("\n\n\\pagebreak\n")
```

```{r response_Map, echo=FALSE, warning=FALSE, eval=FALSE}
names <- names(countryanswers)
namesLower <- upFirst(names, alllower=TRUE)

#Replace the upper cases by lower cases
DF <- data.frame(namesLower, countryanswers, stringsAsFactors=FALSE)
names(DF) <- c("region", "value")

# change serbia by republic of serbia
DF[which(DF$region=="serbia"),1] <- "republic of serbia"

# deleting malta which is not in your regions
DF <-DF[-which(DF$region=="malta" | DF$region=="andorra" | DF$region=="liechtenstein" | DF$region=="monaco" | DF$region=="san marino"),]

## Problem with France data
DF <- DF[-26,]
## Discussion here

country_choropleth(DF,
                   legend = "Number",
                   zoom = c("albania", "armenia", "austria", "azerbaijan", "belgium", "bosnia and herzegovina", "belarus", "bulgaria", "croatia",   "cyprus"  , "czech republic", "denmark", "greece", "estonia", "finland", "france",  "georgia", "germany", "hungary", "iceland", "kazakhstan", "luxembourg", "netherlands", "norway", "ireland", "israel", "italy", "ireland", "latvia", "lithuania", "macedonia", "moldova", "montenegro", "poland", "portugal", "romania", "russia", "slovakia", "slovenia", "spain", "sweden", "switzerland", "united kingdom", "republic of serbia", "turkey", "ukraine")) + xlim(-20,30) + ylim(30,75) + ggtitle("Participants of the study") + theme(plot.title = element_text(lineheight=15, face="bold"))
```