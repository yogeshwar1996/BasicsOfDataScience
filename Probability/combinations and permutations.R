# Key points
# paste() joins two strings and inserts a space in between.
# expand.grid() gives the combinations of 2 vectors or lists.
# permutations(n,r) from the gtools package lists the different ways that r items can be selected from a set of n options when order matters.
# combinations(n,r) from the gtools package lists the different ways that r items can be selected from a set of n options when order does not matter.
library(gtools)
# joining strings with paste
number <- "Three"
suit <- "Hearts"
paste(number, suit)

# joining vectors element-wise with paste
paste(letters[1:5], as.character(1:5))
# generating combinations of 2 vectors with expand.grid
expand.grid(pants = c("blue", "black"), shirt = c("white", "grey", "plaid"))
