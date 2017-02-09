class TowersOfHanoi
  attr_reader :first, :second, :third

  def initialize(size = 5)
    @size = size
    @first = size.downto(1).to_a
    @second = []
    @third = []
  end

  def make_move(start, finish)
    raise "Invalid move!" if start.empty?
    raise "Invalid move!" unless finish.empty? || finish.last > start.last
    finish << start.pop
  end

  def won?
    return false unless @first.empty?
    @second == @size.downto(1).to_a || @third == @size.downto(1).to_a
  end

  def get_input(position)
    puts "Select #{position} tower. 1, 2, or 3"
    tower = gets.chomp
    case tower
    when "1"
      @first
    when "2"
      @second
    when "3"
      @third
    else
      raise "Invalid move!"
    end
  end

  def render
    puts "First tower:  #{@first.join(' ')}"
    puts "Second tower: #{@second.join(' ')}"
    puts "Third tower:  #{@third.join(' ')}"
  end

  def play
    until won?
      render
      begin
        start_pos = get_input("starting")
        end_pos = get_input("ending")
        make_move(start_pos, end_pos)
      rescue
        puts "Invalid move!!!!!!!!"
        retry
      end
    end
    puts "Congrats! You won! :)"
  end

end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
