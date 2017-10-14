get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @round = Round.create(user_id: session[:user_id], deck_id: params[:id])
  session[:round] = @round.id
  session[:deck] = @deck.cards
  p session
  erb :'decks/show'
end


get '/sessions-view' do
  session.inspect
end

get '/sessions-clear' do
  session.clear
end
