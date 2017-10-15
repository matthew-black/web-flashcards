class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def prepare_card
    Card.find(remaining_cards.sample)
  end

  def all_donesies?
    remaining_cards.empty?
  end

  def supply_answer
    return nil if guesses.last == nil
    if !self.guesses.last.is_correct
      self.guesses.last.card.answer
    end
  end

  def first_guess_correct
    cards = self.guesses.map { |guess| guess.card_id }
    cards.select { |card| cards.count(card) == 1 }.count
  end

  private
  def remaining_cards
    all_card_ids = self.deck.cards.pluck(:id)
    solved_guesses = self.guesses.select { |guess| guess.is_correct == true }
    solved_card_ids = solved_guesses.map { |guess| guess.card_id }
    remaining_card_ids = all_card_ids - solved_card_ids
  end
end
