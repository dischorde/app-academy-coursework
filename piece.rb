class Piece
  def initialize(color, symbol, position, board)
    @color = color
    @symbol = symbol
    @position = position
    @board = board
  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :color, :symbol

  def initialize
    @color = nil
    @symbol = nil
    @position = nil
    @board = nil
  end
end
