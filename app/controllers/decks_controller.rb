get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  session[:round_id] = Round.create(user_id: session[:user_id], deck_id: params[:id]).id
  erb :'decks/show'
end


get '/sessions-view' do
  session.inspect
end

get '/sessions-clear' do
  session.clear
end

  # deck = Round.find(session[:round]).deck_id
  # all_card_ids = deck.cards.pluck(:id)
  # solved_card_ids = @round.guesses.select { |guess| guess.is_correct }
  # card_ids = all_card_ids - solved_card_ids
  # ep card_ids
  # @card = Card.find_by(id: card_ids.sample)
  # ep @card
