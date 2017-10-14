class Card < ApplicationRecord
  has_many :guesses
  belongs_to :deck
end
