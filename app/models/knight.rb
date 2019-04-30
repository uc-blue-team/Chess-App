class Knight < Piece
	def valid_move?(dest_x, dest_y)
		if off_the_board?(dest_x,dest_y)
			raise "invalid input"
		elsif is_occupied_by_friend?(dest_x,dest_y)
			raise "invalid input"
		elsif !L_move?(dest_x,dest_y)
			raise "invalid input"
		else
			return true
		end
	end

	private

	def L_move?(dest_x,dest_y)
		(dest_x - x_position).abs < 3  && (dest_y - y_position).abs < 3  && ((dest_x - x_position).abs + (dest_y - y_position).abs) < 4
	end
end
