class AddColumnsToGames < ActiveRecord::Migration[5.2]
  def change
  	add_column :games, :game_state, :string
  	add_column :games, :white, :string
  	add_column :games, :black, :string
  	add_column :games, :white_turn, :boolean
  end
end
