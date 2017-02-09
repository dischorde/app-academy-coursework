#SOLUTION (OURS SURELY SUCKED)

class ComputerPlayer
  attr_accessor :previous_guess, :board_size

  def initialize(size)
    @board_size = size
    @matched_cards = {}
    @known_cards = {}
    @previous_guess = nil
  end

  def receive_revealed_card(pos,value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end

  def get_input
    if previous_guess
      second_guess
    else
      first_guess
    end
  end

  def unmatched_pos
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) &&
          !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end

    pos
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] &&
        !@matched_cards[pos]
    end

    pos
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

  def random_guess
    guess = nil

    until guess && !@known_cards[guess]
      guess = [rand(board_size), rand(board_size)]
    end

    guess
  end
end

# class ComputerPlayer
#
#   def initialize(positions, name = "Bobby")
#     @name = name
#     @known_cards = Hash.new { |h, k| h[k] = [] }
#     @remaining_positions = positions
#     @matched_positions = []
#     @previous_value = Hash.new { |h, k| h[k] = [] }
#   end
#
#   def prompt
#     guess = nil
#     keys = @known_cards.keys.select { |el| el.size == 2 }
#     if keys.empty?
#       return @remaining_positions.sample if guessed_positions.nil?
#       guess = @remaining_positions.reject { |pos| guessed_positions.include?(pos) }.first
#     else
#       keys.each do |key|
#         next if @known_cards[key].any? { |pos| @matched_positions.include?(pos) }
#         guess = @known_cards[key].values.first
#         @known_cards[key].values.rotate!
#       end
#     end
#     guess
#   end
#
#   def guessed_positions
#     @known_cards.values.inject(&:+)
#   end
#
#   def receive_revealed_card(pos, face_value)
#     @known_cards[face_value] << pos unless @known_cards[face_value].include?(pos)
#     receive_match([@previous_value.values.first, pos]) if face_value == @previous_value.keys.first
#     @previous_value[face_value] << pos
#     @previous_value = Hash.new { |h, k| h[k] = [] } if @previous_value.size == 2 || @previous_value.first.size == 2
#   end
#
#   def receive_match(*positions)
#     @matched_positions += positions
#     positions.each { |pos| @remaining_positions.delete(pos) }
#   end
#
# end
