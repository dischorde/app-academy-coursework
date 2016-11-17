class Tile
  attr_reader :is_bomb, :revealed
  attr_accessor :fringe_val

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
    @flagged = false
    @revealed = false
    @fringe_val = nil
  end

  def reveal
    @revealed = true
  end

  def to_s
  end

  def flag
    @flagged = !@flagged
  end

end
