#DataCamp course STAT part exercises

# Case 1: change the LOESS span:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(se = F, span = 0.7)

# Case 2: Set the overall model to the default LOESS and use a span of 0.7.
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F, span = 0.75) +
  stat_smooth(method = "auto", se=F, aes(group=1), span = 0.7)
  

# Case 3: Set col to "All", inside the aes layer:
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F, span = 0.75) +
  stat_smooth(method = "auto", se=F, aes(group=1, col="All"), span = 0.7)




# Case 4: Add scale_color_manual to change the colors
myColors <- c(brewer.pal(3, "Dark2"), "black")

ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F, span = 0.75) +
  stat_smooth(method = "auto", se=F, aes(group=1, col="All"), span = 0.7) +
  scale_color_manual("Cylinders", values = myColors)

When mapping onto color you can sometimes treat a continuous scale, like year, as an ordinal variable, but only if it is a regular series. The better alternative is to leave it as a continuous variable and use the group aesthetic as a factor to make sure your plot is drawn correctly.
# Plot 1: Jittered scatter plot, add a linear model (lm) smooth:
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  geom_jitter(alpha = 0.2) +
  stat_smooth(method="lm", se=F, geom="smooth")


# Plot 2: Only lm, colored by year
ggplot(Vocab, aes(x = education, y = vocabulary, colour=factor(year))) +
  stat_smooth(method="lm", se=F)

# Plot 3: Set a color brewer palette
ggplot(Vocab, aes(x = education, y = vocabulary, colour=factor(year))) +
  stat_smooth(method="lm", se=F) +
    scale_color_brewer()

# Plot 4: Change col and group, specify alpha, size and geom, and add scale_color_gradient
ggplot(Vocab, aes(x = education, y = vocabulary, colour=year, group=factor(year))) +
  stat_smooth(method="lm", se=F, geom="path", alpha=0.6, size=2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

# Use stat_quantile instead of stat_smooth:
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_quantile(alpha = 0.6, size=2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

# Set quantile to 0.5:
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_quantile(, size=2, alpha = 0.6, quantiles=0.5) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))

  