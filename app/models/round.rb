class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def prepare_card
    all_card_ids = self.deck.cards.pluck(:id)
    solved_guesses = self.guesses.select { |guess| guess.is_correct }
    solved_card_ids = solved_guesses.map { |guess| guess.card_id }
    remaining_card_ids = all_card_ids - solved_card_ids
    Card.find(remaining_card_ids.sample)
  end
end
