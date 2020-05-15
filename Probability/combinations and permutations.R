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

# Code: Generating a deck of cards

suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
deck <- paste(deck$number, deck$suit)

# probability of drawing a king
kings <- paste("King", suits)
mean(deck %in% kings) == 1/13

# permutations(n, r, v=1:n, set=TRUE, repeats.allowed=FALSE)
#  n = Size of the source vector
#  r = Size of the target vectors
#  v = Source vector. Defaults to 1:n
# set = Logical flag indicating whether duplicates should be removed from the source vector v. Defaults to TRUE
# repeats.allowed = Logical flag indicating whether the constructed vectors may include duplicated values. Defaults to FALSE.
permutations(5,2)    # ways to choose 2 numbers one by one from 1:5 without replacement
seven_digit_numbers_with_each_digit_unique <- permutations(10, 7, v = 0:9)
no_of_rows = nrow(seven_digit_numbers_with_each_digit_unique)
no_of_columns = ncol(seven_digit_numbers_with_each_digit_unique)
