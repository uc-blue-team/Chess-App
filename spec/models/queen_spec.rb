require 'rails_helper'

RSpec.describe Queen, type: :model do
	describe "valid_move?" do
		it "should return true on a lateral, unobstructed move" do
			game = Game.create
			queen = Queen.create(y_position: 4, x_position: 4, game: game)
			expect(queen.valid_move?(5, 4)).to eq(true)
		end
		it "should return true on a vertical, unobstructed move" do
		end

		it "should return true on a horizontal, unobstructed move" do
		end


	end
end
