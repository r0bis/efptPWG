---
output: pdf_document
---
# To do list

* write about the context of the study : Michal Raszka, Rita, Roberts, Alina (RK)
* Get the French Psychotherapy study
* add a column with name
* merge all the data : analysis in the whole europe (TG) http://www.r-bloggers.com/string-concatenation-in-r/ Done
** number of trainee in each country (TG)
 principle - list directories read that list into a vector then for each element of the vector (i.e. country name) and all the syntax files for that reason also start with the country name so if country name is a variable we simply subsititute that variable into the script when we loop over the list (i.e. the vector) containing names of durectories

* Europe map: R actually has good mapping capabilities. We should be able to produce plots of Europe with each country in colour depending on the particular variable in that country. A heatmap of sorts, where the word "map" is for real (TG) Done

* Ask help for statistical inference ? MOOC : https://www.coursera.org/learn/statistical-inference/home/welcome

* NB : change labels in the analysis file not in syntax file

## Combine graphs (RK)
I will try to group graphs by sections so that we have each major section of the survey on one page.

## Improve esthetism of the graphs (RK)
I will try to do all plots with *ggplot2* as I know it supports colour palettes / themes very nicely.

## Improve tables (TG)
- Replace not Selected by No
- Do a mixed bar plot for pies
http://kbroman.org/knitr_knutshell/pages/figs_tables.html
https://www.qwant.com/?q=ggplot&t=images

## Add (TG)
- UEMS recommandation abline http://stat.ethz.ch/R-manual/R-devel/library/graphics/html/abline.html Done - *?* just a thought: what data we are trying to show by it? Perhaps we best show percentage differences between awareness and implementation awareness?
- Mean European abline

q9df <- data[,16:21]

\newpage

# To use git (after installation)
* cd to the appropriate repo !!!

* git status
* git pull origin master

* modify stuff

* git status
* git add .
* git commit -m "my message"
* git push origin master
