# A restaurant manager wants to advertise that his lunch special offers enough choices to eat different meals every day of the year.
# He doesn't think his current special actually allows that number of choices,
# but wants to change his special if needed to allow at least 365 choices.

# A meal at the restaurant includes 1 entree, 2 sides, and 1 drink.

# He currently offers a choice of 1 entree from a list of 6 options, 
# a choice of 2 different sides from a list of 6 options, 
# and a choice of 1 drink from a list of 2 options.

# How many meal combinations are possible with the current menu?
# Here order is not important

# Way1 thought verbal
# 6 possibilities for an entree 
# 6 possibilities of 1st side and 5 possibilities for 2nd side
# 2 possibilities for a drink
# No_of_choices = (6*6*5*2) - Wrong
# No_of_choices = (6 * ((6*5)/2) * 2) - Correct bcz order of selection of side does not matter
# Note we divide by 2 to remove the duplicates 


# Way2 - Correct - counted all the possibilities
library(gtools)
entree_options = c('a','b','c','d','e','f')
side_options = c('p','q','r','s','t','u')
drink_options = c('x','y')
possible_sides = combinations(6,2,side_options)
possible_sides_as_vector = paste(possible_sides[,1], possible_sides[,2])
nrow(expand.grid(entree_options, possible_sides_as_vector, drink_options))

# The manager has one additional drink he could add to the special.
# How many combinations are possible if he expands his original special to 3 drink options?
entree_options = c('a','b','c','d','e','f')
side_options = c('p','q','r','s','t','u')
drink_options = c('x','y','z')
possible_sides = combinations(6,2,side_options)
possible_sides_as_vector = paste(possible_sides[,1], possible_sides[,2])
nrow(expand.grid(entree_options, possible_sides_as_vector, drink_options))

# The manager decides to add the third drink but needs to expand the number of options.
# The manager would prefer not to change his menu further and
# wants to know if he can meet his goal by letting customers choose more sides.
# How many meal combinations are there if customers
# can choose from 6 entrees, 3 drinks, and select 3 sides from the current 6 options?
entree_options = c('a','b','c','d','e','f')
side_options = c('p','q','r','s','t','u')
drink_options = c('x','y','z')
possible_sides = combinations(6,3,side_options)
possible_sides_as_vector = paste(possible_sides[,1], possible_sides[,2], possible_sides[,2])
nrow(expand.grid(entree_options, possible_sides_as_vector, drink_options))

# The manager is concerned that customers may not want 3 sides with their meal.
# He is willing to increase the number of entree choices instead,
# but if he adds too many expensive options it could eat into profits.
# He wants to know how many entree choices he would have to offer in order to meet his goal.
# - Write a function that takes a number of entree choices and
# returns the number of meal combinations possible 
# given that number of entree options, 3 drink choices, and a selection of 2 sides from 6 options.

# Use sapply() to apply the function to entree option counts ranging from 1 to 12.
no_of_entree_choices = seq(1,12)
get_no_of_meal_combinations = function(N){
  # entree_choices* 2sidefrom6choiceswhere_side_selection_sequence_does_not_matter * drink_choices
  N * nrow(combinations(6,2, repeats.allowed = FALSE)) * 3
}
meal_combinations = sapply(no_of_entree_choices, get_no_of_meal_combinations)
# which.min(meal_combinations>=365) - Wrong Which.min bcz it gives index of minimum value in list of indices
# but we want value of value of minium index in list of indices, so the correct way is as follows
min(which(meal_combinations>=365))


# The manager isn't sure he can afford to put that many entree choices on the lunch menu
# and thinks it would be cheaper for him to expand the number of sides.
# He wants to know how many sides he would have to offer to meet his goal of at least 365 combinations.
# - Write a function that takes a number of side choices and returns the number of meal combinations possible
# given 6 entree choices, 3 drink choices, and a selection of 2 sides from the specified number of side choices.
# - Use sapply() to apply the function to side counts ranging from 2 to 12.

no_of_side_choices = seq(2,12)
get_no_of_meal_combinations = function(N){
  # entree_choices* 2sidefromNchoiceswhere_side_selection_sequence_does_not_matter * drink_choices
  6 * nrow(combinations(N,2, repeats.allowed = FALSE)) * 3
}
meal_combinations = sapply(no_of_side_choices, get_no_of_meal_combinations)
# which.min(meal_combinations>=365) - Wrong Which.min bcz it gives index of minimum value in list of indices
# but we want value of value of minium index in list of indices, so the correct way is as follows
min_index_where_meals_at_least365 = min(which(meal_combinations>=365))
corsp_sides_given_as_choice = no_of_side_choices[min_index_where_meals_at_least365]

