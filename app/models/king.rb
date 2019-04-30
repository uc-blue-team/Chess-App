class King < Piece

	def valid_move?(dest_x, dest_y)
		if is_lateral?(dest_x,dest_y) && (dest_x == x_position + 1 or dest_x == x_position - 1) && !is_occupied_by_friend?(dest_x, dest_y) && !off_the_board?(dest_x,dest_y)	
			true
		elsif is_vertical?(dest_x,dest_y) && (dest_y == y_position + 1 or dest_y == y_position - 1) && !is_occupied_by_friend?(dest_x, dest_y) && !off_the_board?(dest_x,dest_y)	
			true
		elsif is_diagonal?(dest_x,dest_y) && (x_position - dest_x).abs.eql?(1) && !is_occupied_by_friend?(dest_x, dest_y) && !off_the_board?(dest_x,dest_y)	
		 	true
		else 
			false
		end
	end

	def move_out_of_check?
		starting_x = x_position
		starting_y = y_position
		moveable = false
		((x_position - 1)..(x_position + 1)).each do |x|
			((y_position - 1)..(y_position + 1)).each do |y|
				if (x > 0 && x < 7 && y > 0 && y < 7) && valid_move?(x,y)
					update_attributes(x_position: x, y_position: y)
					moveable = true unless game.game_in_check?
					update_attributes(x_position: starting_x, y_position: starting_y)
				end
			end
		end
		moveable
	end
end
