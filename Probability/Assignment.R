# Say you’ve drawn 5 balls from the a box that has 3 cyan balls, 5 magenta balls, and 7 yellow balls,
# with replacement, and all have been yellow.
# What is the probability that the next one is yellow?

cyan <- 3
magenta <- 5
yellow <- 7

# Assign the variable 'p_yellow' as the probability that a yellow ball is drawn from the box.
p_yellow = yellow/(cyan+magenta+yellow)
# Using the variable 'p_yellow', calculate the probability of drawing a yellow ball on the sixth draw. Print this value to the console.
p_yellow

# If you roll a 6-sided die once, what is the probability of not seeing a 6?
# If you roll a 6-sided die six times, what is the probability of not seeing a 6 on any of those rolls?
# Assign the variable p_no6 as the probability of not seeing a 6 on a single roll.
p_no6 = 5/6

# Then, calculate the probability of not seeing a 6 on six rolls using p_no6.
# Since rolling of a die is an independent event every time
# Pr(not6inRoll1 and not6inRoll2...and not6inRoll6) = Pr(not6inRoll1)*Pr(not6inRoll2)*..Pr(not6inRoll6)*
p_no6^6

# Exercise 4. Probability the Celtics win a game
# Two teams, say the Celtics and the Cavs, are playing a seven game series. 
# The Cavs are a better team and have a 60% chance of winning each game.
# What is the probability that the Celtics win at least one game? 
# Remember that the Celtics must win one of the first four games, or the series will be over!

# Calculate the probability that the Cavs will win the first four games of the series.
# Assign the variable `p_cavs_win4` as the probability that the Cavs will win the first four games of the series.
# p_cavs_win4 = Pr(cavsWin1st and cavsWin2nd and cavsWin3rd and cavsWin4th) = Pr(cavsWin1st) * Pr(cavsWin2nd) * Pr(cavsWin3rd)* Pr(cavsWin4th)
# beacuse each game is independent

p_cavs_win4 =  0.6^4

# Calculate the probability that the Celtics win at least one game in the first four games of the series.
# Celtics win at least one game means cavs do not win the first 4 so
1-pcavs_win4


# Monte carlo simulation
celtic_wins = replicate(B, {
  simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))
  any('win' %in% simulated_games)
})

mean(celtic_wins)







