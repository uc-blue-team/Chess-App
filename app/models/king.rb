class King < Piece

	def valid_move?(dest_x, dest_y)
		if off_the_board?(dest_x,dest_y)
			raise "invalid input"
		elsif is_lateral?(dest_x,dest_y) && (dest_x == x_position + 1 or dest_x == x_position - 1)
			return !lat_check(dest_x,dest_y)
		elsif is_vertical?(dest_x,dest_y) && (dest_y == y_position + 1 or dest_y == y_position - 1)
			return !long_check(dest_x,dest_y)
		elsif is_diagonal?(dest_x,dest_y) && (x_position - dest_x).abs = 1
			return !diag_check(dest_x,dest_y)
		else
			raise "invalid input"
		end
	end

end
