class Tile

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
    @flagged = false
  end

  def to_s
  end

  def flag
    @flagged = !@flagged
  end

end
