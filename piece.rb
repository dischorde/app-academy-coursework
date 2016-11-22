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

class Rook < Piece
  def initialize(color, position, board)
    super(color, :R, position, board)
  end
end

class Bishop < Piece
  def initialize(color, position, board)
    super(color, :B, position, board)
  end
end

class Queen < Piece
  def initialize(color, position, board)
    super(color, :Q, position, board)
  end
end

class Knight < Piece
  def initialize(color, position, board)
    super(color, :N, position, board)
  end
end

class King < Piece
  def initialize(color, position, board)
    super(color, :K, position, board)
  end
end

class Pawm < Piece
  def initialize(color, position, board)
    super(color, :P, position, board)
  end
end
