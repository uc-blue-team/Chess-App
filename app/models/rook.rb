class Rook < Piece
  def valid_move?(dest_x, dest_y)
    if off_the_board?(dest_x,dest_y)
      raise "invalid input"
    elsif 
  end
end
