class Game < ApplicationRecord
	belongs_to :white_player, :class_name => "User", :foreign_key => "WhitePlayer"
	belongs_to :black_player, :class_name => "User", :foreign_key => "BlackPlayer"
	has_many :pieces
end
