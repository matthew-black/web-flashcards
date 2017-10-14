get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :'decks/show'
end

get '/sessions-view' do
  session.inspect
end

get '/sessions-clear' do
  session.clear
end
