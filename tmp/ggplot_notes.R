
legend.position=c(0.9,0.9), plot.background=element_rect(color="grey90"), panel.background=element_rect(color="grey90"), legend.background=element_rect(color="grey90")


# Load ggthemes package
library(ggthemes)

# Apply theme_tufte
theme_set(theme_tufte())
z2

# Apply theme_tufte, modified:
z2 + theme(legend.position=c(0.9,0.9), axis.title=element_text(font="italic", size=12))
        
# Apply theme_igray
z2 + theme_igray()

# Apply theme_igray, modified:
z2 + theme_igray()

stat_summary(geom = 'errorbar', fun.data=mean_sdl, fun.args = list(mult = 1), position=posn.d)

wt.cyl.am + stat_summary(fun.y = 'mean', geom='point', position=posn.d) +
  stat_summary(geom = 'errorbar', fun.data=mean_sdl, fun.args = list(mult = 1), position=posn.d) 



wt.cyl.am + stat_summary(fun.y = 'mean', geom='point', position=posn.d) +
   stat_summary(geom = 'errorbar', fun.data=mean_sdl, fun.args=structure(list(mult = 1), .Names = "mult"), position=posn.d)


for source in house_bkp_14 ogami_Apr_2014 robbie_Apr_2014; do 
    rsync -avh --no-perms --no-owner --no-group --delete $source /mnt
done   


