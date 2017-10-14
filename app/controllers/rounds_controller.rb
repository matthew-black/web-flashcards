

get '/rounds/:id' do
  deck_id = Round.find(session[:round_id]).deck_id
  deck = Deck.find(deck_id)
  round = Round.find(session[:round_id])

  all_card_ids = deck.cards.pluck(:id)
  ep all_card_ids

  successful_guesses = round.guesses.select { |guess| guess.is_correct }
  ep successful_guesses

  solved_card_ids = successful_guesses.map { |guess| guess.card_id }
  ep solved_card_ids

  card_ids = all_card_ids - solved_card_ids


  @card = Card.find_by(id: card_ids.sample)
  erb:'rounds/show'
end


# post route

# look at provided answer
# create guess object in table
#
