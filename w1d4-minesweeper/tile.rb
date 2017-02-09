class Tile
  attr_reader :is_bomb, :revealed, :flagged
  attr_accessor :fringe_val, :pos

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
    @flagged = false
    @revealed = false
    @fringe_val = 0
    @pos = nil
  end

  def reveal
    @revealed = true
  end

  def to_s
    return "F" if @flagged
    return "#" unless @revealed
    return "@" if @is_bomb
    @fringe_val == 0 ? "_" : @fringe_val.to_s
  end

  def flag
    @flagged = !@flagged
  end

  def neighbors
    x, y = @pos
    [[x - 1, y - 1], [x - 1, y], [x - 1, y + 1], [x, y + 1],
     [x + 1, y + 1], [x + 1, y], [x + 1, y - 1], [x, y - 1]]
  end

  def is_neighbor?(tile)
    neighbors.include?(tile.pos)
  end

end
