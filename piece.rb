require_relative "module.rb"
require 'singleton'

class Piece
  attr_reader :color, :symbol, :position, :board

  def initialize(color, symbol, position, board)
    @color = color
    @symbol = symbol
    @position = position
    @board = board
  end


end
