class TowersOfHanoi
  attr_accessor :first, :second, :third

  def initialize(size = 5)
    @size = size
    @first = size.downto(1).to_a
    @second = []
    @third = []
  end

  def make_move(start, finish)
    raise "Invalid move!" if start.empty?
    disk = start.pop
    raise "Invalid move!" unless finish.empty? || finish.last > disk
    finish << disk
  end

  def won?
    return false unless @first.empty?
    @second == @size.downto(1).to_a || @third == @size.downto(1).to_a
  end

end
