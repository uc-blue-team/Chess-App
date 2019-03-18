class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string	 :type
      t.string	 :color
      t.int		 :x_position
      t.int		 :y_position
      t.bool	 :captured
      t.timestamps
    end
  end
end
