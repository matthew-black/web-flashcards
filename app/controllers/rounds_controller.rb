post '/decks/:id/rounds' do
  session[:round_id] = Round.create(user_id: session[:user_id], deck_id: params[:id]).id
  redirect "/rounds/#{session[:round_id]}"
end

get '/rounds/:id' do
  round = Round.find(session[:round_id])
  @card = round.prepare_card
  erb:'rounds/show'
end

post '/rounds/:id/guesses' do
  # make a guess object! do it well!
  # doing it well means case insensitive :)
  redirect "/rounds/#{session[:round_id]}"
end
