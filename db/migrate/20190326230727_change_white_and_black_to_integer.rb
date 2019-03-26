class ChangeWhiteAndBlackToInteger < ActiveRecord::Migration[5.2]
  def change
  	remove_column :games, :White
  	remove_column :games, :Black
  	add_column :games, :white_id, :integer
  	add_column :games, :black_id, :integer
  end
end
