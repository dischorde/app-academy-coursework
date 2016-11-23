require_relative 'piece.rb'

class Pawn < Piece
  def initialize(color, position, board)
    super(color, :P, position, board)
  end

  def to_s
    "P".colorize(color)
  end
end
