class Tile
  def initialize(value = 0)
    @value = value
    @given = (value == 0 ? false : true)
  end

  def to_s
    @value == 0 ? " " : @value.to_s
  end
end
