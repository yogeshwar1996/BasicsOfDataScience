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
#  n = Size of the source vector to use
#  r = Size of the target vectors
#  v = Source vector. Defaults to 1:n
# set = Logical flag indicating whether duplicates should be removed from the source vector v. Defaults to TRUE
# repeats.allowed = Logical flag indicating whether the constructed vectors may include duplicated values. Defaults to FALSE.
permutations(5,2)    # ways to choose 2 numbers one by one from 1:5 without replacement
seven_digit_numbers_with_each_digit_unique <- permutations(10, 7, v = 0:9)

no_of_rows = nrow(seven_digit_numbers_with_each_digit_unique)
no_of_columns = ncol(seven_digit_numbers_with_each_digit_unique)
# Pick 5 random numbers 1 to no of rows
index = sample(no_of_rows, 5)

# Show values of all 7 columns for the above evaluated indices
seven_digit_numbers_with_each_digit_unique[index,]


permutations(3,2)    # order matters
combinations(3,2)    # order does not matter

# Code: Probability of drawing a second king given that one king is drawn

hands <- permutations(52,2, v = deck)
first_card <- hands[,1]
second_card <- hands[,2]
# No of first cards that have a king
sum(first_card %in% kings)
# Using the formula
# Pr(first card is king and second is king) = Pr(first is king) * Pr(second is king given first was king)

# Pr(second is king given first was king) = Pr(first card is king and second is king)/ Pr(first is king)
mean(first_card %in% kings & second_card %in% kings) / mean(first_card %in% kings)

# Code: Probability of a natural 21 in blackjack

aces <- paste("Ace", suits)
facecard <- c("King", "Queen", "Jack", "Ten")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)

hands <- combinations(52, 2, v=deck) # all possible hands

# probability of a natural 21 given that the ace is listed first in `combinations`
mean(hands[,1] %in% aces & hands[,2] %in% facecard)

# probability of a natural 21 checking for both ace first and ace second
mean((hands[,1] %in% aces & hands[,2] %in% facecard)|(hands[,2] %in% aces & hands[,1] %in% facecard))

# Code: Monte Carlo simulation of natural 21 in blackjack

# Note that your exact values will differ because the process is random and the seed is not set.

# code for one hand of blackjack
hand <- sample(deck, 2)
hand

# code for B=10,000 hands of blackjack
B <- 10000
results <- replicate(B, {
  hand <- sample(deck, 2)
  (hand[1] %in% aces & hand[2] %in% facecard) | (hand[2] %in% aces & hand[1] %in% facecard)
})
mean(results)