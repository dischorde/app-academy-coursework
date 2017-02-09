class Board
  def initialize(board_size = 4)
    @grid = Array.new(board_size) { Array.new(board_size) }
    @size = board_size
    populate
  end

  def num_cards
    @size * @size
  end

  def self.default_board
    Array.new(4) { Array.new(4) }
  end

  def populate
    pairs = Card.make_card_pairs(num_cards / 2)
    all_positions.each do |pos|
      self[pos] = pairs.pop
    end
  end

  def render
    puts "   #{(0...@size).to_a.join("     ")}"
    @grid.each_with_index do |row, idx|
      puts "#{idx}  #{row.map(&:to_s).join("  |  ")}"
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def all_positions
    positions = []
    @size.times do |col|
      @size.times do |row|
        positions << [row, col]
      end
    end
    positions
  end

  def won?
    all_positions.all? { |pos| self[pos].revealed }
  end

  def reveal(pos)
    self[pos].reveal
    self[pos]
  end
end
