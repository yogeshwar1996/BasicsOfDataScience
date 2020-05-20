# Problem 3 doors; participant choses one; he is not shown the dooor he chose, but a door that does not have prize
# Whats the probability of this winning
# Now there are two possible events of winning
# Either he chooses to stick to his original selection and  wins
# Or he chooses to switch his selection and win

# Code: Monte Carlo simulation of stick strategy

B <- 1000000
stick <- replicate(B, {
  doors <- as.character(1:3) # Lets assume doors are denoted by nos. 1,2,3
  random_seq <- sample(c("car","goat","goat"))    # randomises the seq of car goat and goat
  # print(random_seq)
  prize_door <- doors[random_seq == "car"]    # save into var the door that has prize
  # print(prize_door)
  my_pick  <- sample(doors, 1)    # make a random pick for the doors
  # print(my_pick)
  show <- sample(doors[!doors %in% c(my_pick, prize_door)],1)    # open door with no prize that isn't chosen
  # print(show)
  stick <- my_pick    # stick with original door
  stick == prize_door    # test whether the original door has the prize
})
mean(stick)    # probability of choosing prize door when sticking

# Code: Monte Carlo simulation of switch strategy

switch <- replicate(B, {
  doors <- as.character(1:3)
  prize <- sample(c("car","goat","goat"))    # puts prizes in random order
  prize_door <- doors[prize == "car"]    # note which door has prize
  my_pick  <- sample(doors, 1)    # note which door is chosen first
  show <- sample(doors[!doors %in% c(my_pick, prize_door)], 1)    # open door with no prize that isn't chosen
  switch <- doors[!doors%in%c(my_pick, show)]    # switch to the door that wasn't chosen first or opened
  switch == prize_door    # test whether the switched door has the prize
})
mean(switch)    # probability of choosing prize door when switching
