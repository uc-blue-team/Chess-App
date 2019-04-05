# frozen_string_literal: true

class Rook < Piece
  def valid_move?(dest_x, dest_y)
    if is_obstructed?(dest_x, dest_y)
      false
    elsif is_occupied_by_friend?(dest_x, dest_y)
      false
    elsif is_lateral?(dest_x, dest_y)
      true
    elsif is_vertical?(dest_x, dest_y)
      true
    else
      false
    end
  end
end
