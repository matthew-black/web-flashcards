class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.boolean :is_correct
      t.integer :card_id
      t.integer :round_id

      t.timestamps
    end
  end
end
