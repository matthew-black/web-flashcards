require 'faker'

# DECK 1
5.times do
  card = {:question => Faker::Pokemon.name, :answer => Faker::Pokemon.location, :deck_id => 1}
  Card.create!(card)
end
Deck.create!(:name=> "Pokemon")

# DECK 2
Card.create(question: "Is Pat kind?", answer: "Yes", deck_id: 2)
Card.create(question: "Is Mitch tall?", answer: "Yes", deck_id: 2)
Card.create(question: "Are rainbows special?", answer: "No" , deck_id: 2)
Deck.create(:name => "Life Questions")

# DECK 3
Card.create(question: "You hungry?", answer: "Yes", deck_id: 3)
Card.create(question: "Is ghost pepper salsa tasty as fuck?", answer: "Yes", deck_id: 3)
Card.create(question: "Are DBC students caffienated?", answer: "Yes", deck_id: 3)
Deck.create(:name => "Foodz")

# DECK 4
Card.create(question: "Which color SPK is best SPK color?", answer: "Yellow", deck_id: 4)
Card.create(question: "When did God create SPKs?", answer: "1970", deck_id: 4)
Card.create(question: "Is there tartaric acid in SPKs?", answer: "Yes", deck_id: 4)
Deck.create(:name => "Sour Patch Kids")


5.times do
  user = { :username => Faker::Internet.user_name, :email => Faker::Internet.email, :password => "password" }
  User.create!(user)
end



# ROUND 1
Round.create(:user_id => 1, :deck_id => 1)
# Yep.
Guess.create(is_correct: false, round_id: 1, card_id: 1)
Guess.create(is_correct: true, round_id: 1, card_id: 1)
Guess.create(is_correct: true, round_id: 1, card_id: 2)
Guess.create(is_correct: false, round_id: 1, card_id: 3)
Guess.create(is_correct: false, round_id: 1, card_id: 3)
Guess.create(is_correct: false, round_id: 1, card_id: 3)
Guess.create(is_correct: true, round_id: 1, card_id: 3)
Guess.create(is_correct: false, round_id: 1, card_id: 4)
Guess.create(is_correct: false, round_id: 1, card_id: 4)
Guess.create(is_correct: false, round_id: 1, card_id: 4)
Guess.create(is_correct: true, round_id: 1, card_id: 4)
Guess.create(is_correct: true, round_id: 1, card_id: 5)

# ROUND 2
Round.create(:user_id => 1, :deck_id => 1)
# Yep.
Guess.create(is_correct: false, round_id: 2, card_id: 5)
Guess.create(is_correct: false, round_id: 2, card_id: 5)
Guess.create(is_correct: true, round_id: 2, card_id: 3)
Guess.create(is_correct: false, round_id: 2, card_id: 3)
Guess.create(is_correct: false, round_id: 2, card_id: 4)
Guess.create(is_correct: false, round_id: 2, card_id: 4)
Guess.create(is_correct: true, round_id: 2, card_id: 2)
Guess.create(is_correct: false, round_id: 2, card_id: 1)
Guess.create(is_correct: true, round_id: 2, card_id: 1)
Guess.create(is_correct: true, round_id: 2, card_id: 4)
Guess.create(is_correct: true, round_id: 2, card_id: 5)

# ROUND 3
Round.create(:user_id => 1, :deck_id => 4)
# Yep.
Guess.create(is_correct: false, round_id: 3, card_id: 12)
Guess.create(is_correct: true, round_id: 3, card_id: 12)
Guess.create(is_correct: true, round_id: 3, card_id: 13)
Guess.create(is_correct: false, round_id: 3, card_id: 14)
Guess.create(is_correct: false, round_id: 3, card_id: 14)
Guess.create(is_correct: true, round_id: 3, card_id: 14)

# ROUND 4 (In progress round.
# (3 cards, 1 is answered correctly on first try, 1 is on 2nd try)
Round.create(:user_id => 2, :deck_id => 2)
# Yep.
Guess.create(is_correct: false, round_id: 4, card_id: 6)
Guess.create(is_correct: false, round_id: 4, card_id: 6)
Guess.create(is_correct: false, round_id: 4, card_id: 8)
Guess.create(is_correct: true, round_id: 4, card_id: 6)
Guess.create(is_correct: false, round_id: 4, card_id: 7)
Guess.create(is_correct: true, round_id: 4, card_id: 8)
Guess.create(is_correct: false, round_id: 4, card_id: 7)
