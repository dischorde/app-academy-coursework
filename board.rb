require_relative "piece.rb"
require_relative "null_piece.rb"
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = default_grid
  end

  def default_grid
    empty_grid = Array.new(8) { Array.new(8) }
    empty_grid.each_with_index do |row, row_num|
      row.each_index do |col|
        if row_num < 2 || row_num > 5
          empty_grid[row_num][col] = Piece.new
        else
          empty_grid[row_num][col] = nil
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]
    raise "No piece to move." if current_piece.nil? #current_piece.is_a? NullPiece current
    raise "Piece cannot move there." unless self[end_pos].nil? #unless current_piece.valid_move?(end_pos)
    self[end_pos] = current_piece
    self[start_pos] = nil #TODO: NullPiece
  end
end
