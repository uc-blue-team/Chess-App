class Bishop < Piece

	def valid_move?(dest_x, dest_y)
		if off_the_board?(dest_x,dest_y)
			raise "invalid input"
		elsif is_diagonal?(dest_x,dest_y) && !is_occupied_by_friend?(dest_x, dest_y) && !is_obstructed?(dest_x, dest_y)
			return true
		else
			raise "invalid input"
		end
	end

end
