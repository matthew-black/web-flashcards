post '/decks/:id/rounds' do
  session[:round_id] = Round.create(user_id: session[:user_id], deck_id: params[:id]).id
  redirect "/rounds/#{session[:round_id]}"
end

get '/rounds/:id' do
  deck_id = Round.find(session[:round_id]).deck_id
  deck = Deck.find(deck_id)
  round = Round.find(session[:round_id])

  all_card_ids = deck.cards.pluck(:id)

  successful_guesses = round.guesses.select { |guess| guess.is_correct }

  solved_card_ids = successful_guesses.map { |guess| guess.card_id }

  card_ids = all_card_ids - solved_card_ids

  @card = Card.find_by(id: card_ids.sample)

  erb:'rounds/show'
end

