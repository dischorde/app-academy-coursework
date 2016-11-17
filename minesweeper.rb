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
    @current_tile.is_bomb || @board.won?
  end

  def get_input
    #RETURN OPERATION STRING AND TITLE OBJECT IN AN ARRAY
  end

  def display_end_condition
    puts board.won? ? "You win!" : "You lose :("
  end

  def check_tile
    @current_tile.reveal
    @board.render
    sleep(2)
  end

end
