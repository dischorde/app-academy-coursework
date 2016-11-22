require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    display = Array.new(8) { Array.new(8) }
    system "clear"
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if [row_idx, col_idx] == @cursor.cursor_pos
        color = ( @cursor.selected ? :yellow : :green )
        el = el.to_s.colorize( :background => color)
        end
        display[row_idx][col_idx] = el
      end
    end
    display.each do |row|
      puts row.join(" | ")
    end
  end

  def move_cur
    loop do
      render
      @cursor.get_input
    end
  end

end
