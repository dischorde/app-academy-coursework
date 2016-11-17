require_relative 'board.rb'

class MinesweeperGame

  def initialize(size = 9)
    @current_tile = nil
    @board = Board.new(size)
  end

  def run
    until game_over?
      @board.render
      operation, @current_tile = get_input
      check_tile if operation == "r"
    end
    display_end_condition
  end

  def game_over?
  end

  def get_input
    #RETURN OPERATION STRING AND TITLE OBJECT IN AN ARRAY
  end

  def display_end_condition
  end

  def check_tile
  end

end
