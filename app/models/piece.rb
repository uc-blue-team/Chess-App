class Piece < ApplicationRecord
	
	Pieces.each do |piece|
		if piece.y_position == start_y && piece.x_position.between?(start_x, dest_x)
				return false
			end
		end
		return true
	end

	def long_check?(start_x,start_y,dest_x,dest_y)
		Pieces.each do |piece|
			if piece.x_position == start_x && piece.y_position.between?(start_y, dest_y)
				return false
			end
		end
		return true
	end

	def diag_check?(start_x,start_y,dest_x,dest_y)

	end

	def valid_move?(start_x,start_y,dest_x,dest_y)
		if ((start_y - dest_y)/(start_x - dest_x)).abs != (1) 
			return false
	end

	def is_obstructed?(start_x,start_y,dest_x,dest_y)
		start_x = x1
		start_y = y1
		dest_x = x2
		dest_y = y2
		if y1 == y2
			return lat_check?(x1,y1,x2,y2)
		elsif x1 == x2
			return long_check?(x1,y1,x2,y2) 
		elsif ((y1 - y2)/(x1 - x2)).abs.eql?(1)
			return diag_check?(x1,y1,x2,y2)
		else
			return valid_move?(x1,y1,x2,y2)
		end


end
