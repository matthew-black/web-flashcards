class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def first_guess_correct

  end
end
