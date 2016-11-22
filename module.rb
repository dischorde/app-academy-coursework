require 'byebug'
module SteppingPiece
KNIGHT_DELTAS = [[1,2],
                [2,1],
                [2,-1],
                [1,-2],
                [-1,-2],
                [-2,-1],
                [-2,1],
                [-1,2]]
KINGS_DELTAS = [[1,0],
                [1,1],
                [0,1],
                [-1,1],
                [-1,0],
                [-1,-1],
                [0,-1],
                [1,-1]]

def moves
  deltas = self.is_a?(King) ? KINGS_DELTAS : KNIGHT_DELTAS
  deltas.map { |delta| [delta[0] + position[0], delta[1] + position[1]] }
end
end
module SlidingPiece
  DIAG_DELTAS = [ [1,1],
                [-1,1],
                [-1,-1],
                [1,-1]]
  R_C_DELTAS = [  [1,0],
                [0,1],
                [-1,0],
                [0,-1]]

  def moves
    possible_moves = []
    permisions = self.move_dirs
    possible_moves += diag_moves if permisions.include?(:X)
    possible_moves += row_col_moves if permisions.include?(:H)
    possible_moves
  end

  def diag_moves
    all_diags = []
    DIAG_DELTAS.each do |delta|
      7.times do |spacer|
        new_x = position[0] + (delta[0] * (spacer + 1))
        new_y = position[1] + (delta[1] * (spacer + 1))
        all_diags << [new_x, new_y]
      end
    end
    all_diags
  end

  def row_col_moves
    all_row_col_moves = []
    R_C_DELTAS.each do |delta|
      7.times do |spacer|
        new_x = position[0] + (delta[0] * (spacer + 1))
        new_y = position[1] + (delta[1] * (spacer + 1))
        all_row_col_moves << [new_x, new_y]
      end
    end
    all_row_col_moves
  end

end
