class Tile
  attr_reader :is_bomb, :revealed
  attr_accessor :fringe_val

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
    @flagged = false
    @revealed = false
    @fringe_val = 0
  end

  def reveal
    @revealed = true
  end

  def to_s
    return "#" unless @revealed
    return "F" if @flagged
    return "@" if @is_bomb
    @fringe_val == 0 ? "_" : @fringe_val.to_s
  end

  def flag
    @flagged = !@flagged
  end

end
