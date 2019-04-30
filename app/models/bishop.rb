class Bishop < Piece

	def valid_move?(dest_x, dest_y)
		if is_diagonal?(dest_x,dest_y) && !is_occupied_by_friend?(dest_x, dest_y) && !is_obstructed?(dest_x, dest_y) && !off_the_board?(dest_x,dest_y)	
			true
		else
			false
		end
	end

end
