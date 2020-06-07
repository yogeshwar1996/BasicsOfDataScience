# A casino offers a House Special bet on roulette, which is a bet on five pockets (00, 0, 1, 2, 3) out of 38
# total pockets. The bet pays out 6 to 1. In other words, a losing bet yields -$1 and a successful bet yields $6. 
# A gambler wants to know the chance of losing money if he places 500 bets on the roulette House Special.


p_winning = 5/38
p_lossing = 1 - p_winning
award = 6
loss = -1
# Q1.What is the expected value of the payout for one bet?
exepected_payout_from_single_bet = (award*p_winning) + (loss*p_lossing)
# Q2. What is the standard error of the payout for one bet?
std_err_in_payout_for_single_bet = abs(award-loss) * sqrt(p_winning*p_lossing)

# Q3. What is the expected value of the average payout over 500 bets?
exepected_average_payout_from_500_bet = exepected_payout_from_single_bet

# Q4.What is the standard error of the average payout over 500 bets?
std_err_in_payout_for_single_bet/sqrt(500)

# Q5. What is the expected value of the sum of 500 bets?
expected_value_of_the_sum_of_500_bets = exepected_payout_from_single_bet * 500

# Q6. What is the standard error of the sum of 500 bets?
std_err_in_the_sum_of_500_bets = std_err_in_payout_for_single_bet * sqrt(500)

# Q7.Use pnorm() with the expected value of the sum and standard error of the sum to calculate the probability of losing money over 500 bets,  Pr(X≤0) .

pnorm(0,expected_value_of_the_sum_of_500_bets,std_err_in_the_sum_of_500_bets)











