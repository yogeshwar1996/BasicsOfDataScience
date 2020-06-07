# An old version of the SAT college entrance exam had a -0.25 point penalty for every 
# incorrect answer and awarded 1 point for a correct answer. 
# The quantitative test consisted of 44 multiple-choice questions each with 5 answer choices. 
# Suppose a student chooses answers by guessing for all questions on the test.

#1. What is the probability of guessing correctly for one question
1/5
#2. What is the expected value of points for guessing on one question?
exepected_score_of_one_guess = (1*(1/5)) + (-0.25*(4/5) )

#3. What is the expected score of guessing on all 44 questions?
expected_score_of_guessing_on_all_44_questions = 44*(exepected_score_of_one_guess)

#4. What is the standard error of guessing on all 44 questions?
standard_error_of_guessing_on_all_44_questions = sqrt(44)*abs(-0.25 - 1)*sqrt((1/5)*(4/5))

#5. Use the Central Limit Theorem to determine the probability that a guessing student 
# scores 8 points or higher on the test.
1-pnorm(8, expected_score_of_guessing_on_all_44_questions,standard_error_of_guessing_on_all_44_questions)

set.seed(21)

#6. Then run a Monte Carlo simulation of 10,000 students guessing on the test
n = 44
B = 10000
test_result = function(no_of_questions){
  # result of a test of 44 questions
  score = sample(c(1,-0.25), no_of_questions, replace=TRUE, prob=c(1/5,4/5))
  sum(score)
}

scores_of_all_students = replicate(B, test_result(n))
#7. What is the probability that a guessing student scores 8 points or higher?
mean(scores_of_all_students>8)

# The SAT was recently changed to reduce the number of multiple choice options from 5 to 4 and also to eliminate the penalty for guessing.
# Suppose that the number of multiple choice options is 4 and that there is no penalty for guessing - that is, an incorrect question gives a score of 0.
#8. What is the expected value of the score when guessing on this new test?
exepected_score_of_one_guess = (1*(1/4)) + (0*(3/4))
expected_score_in_test = 44*exepected_score_of_one_guess

#9. Consider a range of correct answer probabilities p <- seq(0.25, 0.95, 0.05) representing a range of student skills.
p <- seq(0.25, 0.95, 0.05)
# What is the lowest p such that the probability of scoring over 35 exceeds 80%?
award = 1
penalty = 0
no_questions = 44
# Apply to all levels of probabilities of correct answers
probabilities <- sapply(p, function(prob_correct_answers){
  expected_point_for_a_question <- (award*prob_correct_answers) + (penalty * (1-prob_correct_answers))
  mean_score <- no_questions * expected_point_for_a_question
  standard_error <- sqrt(no_questions) * abs(penalty-award) * sqrt(prob_correct_answers*(1-prob_correct_answers))
  # Probability that student will score more than 35, when we know the probability of correctness of his answers
  1-pnorm (35, mean_score, standard_error)
})

# which gives all the indices where condition is satisfied
# min gives lowest value in p from the
min(p[which(probabilities > 0.8)])
