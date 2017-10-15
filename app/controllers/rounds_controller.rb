post '/decks/:id/rounds' do
  session[:round_id] = Round.create(user_id: session[:user_id], deck_id: params[:id]).id
  redirect "/rounds/#{session[:round_id]}"
end

get '/rounds/:id' do
  round = Round.find(session[:round_id])
  @card = round.prepare_card
  erb:'rounds/show'
end

post '/rounds/:round_id/card/:card_id/guesses' do
  card = Card.find(params[:card_id])
  @guess = Guess.create(:round_id => session[:round_id], :card_id => params[:card_id])

  if card.answer.downcase == params[:response].downcase
    @guess.is_correct = true
    @guess.save
  end

  round = Round.find(session[:round_id])
  if round.all_donesies?
    redirect "/users/#{current_user.id}"
  else
    redirect "/rounds/#{session[:round_id]}"
  end
end



