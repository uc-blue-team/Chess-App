class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.string   :type
      t.string   :color
      t.integer   :x_position
      t.integer   :y_position
      t.boolean   :captured
      t.timestamps
    end
  end
end
