class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string   :name
      t.string 	 :game_state
      t.string	 :White
      t.string	 :Black
      t.boolean	 :white_turn
      t.timestamps
    end
  end
end
