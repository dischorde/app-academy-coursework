require_relative 'board.rb'

class MinesweeperGame

  def initialize(size = 9)
    @current_tile = nil
    @board = Board.new(size)
  end

  def run
    until game_over?
      system("clear")
      @board.render
      operation, @current_tile = get_input
      check_tile if operation == "r"
      @current_tile.flag if operation == "f"
    end
    display_end_condition
  end

  def game_over?
    return false if @current_tile.nil?
    @current_tile.is_bomb || @board.won?
  end

  def get_input
    puts "Enter an operation followed by a postion"
    puts "f = flag, r = reveal"
    puts "For example: f,2,5"
    parse_input(gets.chomp)
  end

  def parse_input(input)
    arr = input.split(',').map { |el| el =~ /\d/ ? el.to_i : el }
    op = arr.shift
    [op, @board[arr]]
  end

  def display_end_condition
    system("clear")
    @board.render
    puts @board.won? ? "You win!" : "You lose :("
  end

  def check_tile
    @board.reveal_applicable(@current_tile)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = MinesweeperGame.new
  game.run
end
