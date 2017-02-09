require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class MemoryGame
  def initialize(board = Board.new, player = HumanPlayer.new(4))
    @board = board
    @previous_guess = nil
    @player = player
  end

  def play
    until over?
      show_board
      pos = get_player_input
      make_guess(pos)
      sleep(1)
    end
    puts "YOU WON!"
  end

  #SOLUTION
  def get_player_input
    pos = nil

    until pos && valid_pos?(pos)
      pos = @player.get_input
    end

    pos
  end

  def make_guess(pos)
    revealed_value = board.reveal(pos)
    player.receive_revealed_card(pos, revealed_value)
    board.render

    compare_guess(pos)

    sleep(1)
    board.render
  end


  # def check_guess(pos)
  #   current_card = @board.reveal(pos)
  #   @player.receive_revealed_card(pos, current_card.face_value)
  #   show_board
  #   if @previous_guess.nil?
  #     @previous_guess = current_card
  #   else
  #     unless @previous_guess == current_card
  #       @previous_guess.hide
  #       current_card.hide
  #     end
  #     @previous_guess = nil
  #   end
  # end

  # SOLUTION
  def check_guess(new_guess)
    if previous_guess
      if match?(previous_guess, new_guess)
        player.receive_match(previous_guess, new_guess)
      else
        puts "Try again."
        [previous_guess, new_guess].each { |pos| board.hide(pos) }
      end
      self.previous_guess = nil
      player.previous_guess = nil
    else
      self.previous_guess = new_guess
      player.previous_guess = new_guess
    end
  end

  #SOLUTION
  def match?(pos1, pos2)
    board[pos1] == board[pos2]
  end

  # SOLUTION:
  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.count == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) }
  end

  def show_board
    system("clear")
    @board.render
  end

  def over?
    @board.won?
  end

  #SOLUTION:
  private
  attr_accessor :previous_guess
  attr_reader :board

end


if $PROGRAM_NAME == __FILE__
  board = Board.new
  computer_player = ComputerPlayer.new(board.all_positions, "Bob")


  game = MemoryGame.new(board, computer_player)
  game.play
end
