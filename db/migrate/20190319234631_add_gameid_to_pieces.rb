class AddGameidToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :game_id, :integer
  end
end
