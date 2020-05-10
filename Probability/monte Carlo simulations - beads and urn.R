# Monte Carlo simulations model the probability of different outcomes 
# by repeating a random process a large enough number of times that 
# the results are similar to what would be observed if the process were repeated forever.
# create an urn with 2 red, 3 blue
beads <- rep(c("red", "blue"), times = c(2,3))    
# view beads object
beads   
#draw a  sample  of 1 bead at random
# Note by default sample is drawn without replacement
sample(beads, 1)
# number of times to draw 1 bead
B <- 10000   
# draw 1 bead, B times
events <- replicate(B, sample(beads, 1)) 
# make a table of outcome counts
tab <- table(events)    
# view count table
tab    
# view table of outcome proportions
prop.table(tab)   

# draw sample with replacement then you dont have to use replicate
events=sample(beads, B, replace = TRUE)
tab = table(events)
tab
prop.table(tab)
# Note result will be close to what was achieved without replacement