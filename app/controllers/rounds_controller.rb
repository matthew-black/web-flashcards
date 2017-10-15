post '/decks/:id/rounds' do
  session[:round_id] = Round.create(user_id: session[:user_id], deck_id: params[:id]).id
  redirect "/rounds/#{session[:round_id]}"
end

get '/rounds/:id' do
  @round = Round.find(session[:round_id])
  if !@round.all_donesies?
    @card = @round.prepare_card
  end
  erb:'rounds/show'
end

post '/rounds/:round_id/card/:card_id/guesses' do
  @round = Round.find(session[:round_id])
  card = Card.find(params[:card_id])
  @guess = Guess.create(:round_id => session[:round_id], :card_id => params[:card_id])

  if card.answer.downcase == params[:response].downcase
    @guess.is_correct = true
    @guess.save
  end
  redirect "/rounds/#{session[:round_id]}"
end



