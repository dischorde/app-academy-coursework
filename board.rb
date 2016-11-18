require_relative 'tile.rb'

class Board

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size) { Array.new(grid_size) }
    populate
  end

  def won?
    not_bombs = @grid.flatten.reject(&:is_bomb)
    not_bombs.all?(&:revealed)
  end

  def render
    puts "  #{(0...size).to_a.join(' ')}"
    @grid.each.with_index do |row, idx|
      puts "#{idx} #{row.map(&:to_s).join(' ')}"
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

  def populate
    tiles = []
    total_tiles = size**2
    num_bombs = total_tiles / 6
    num_bombs.times { tiles << Tile.new(true) }
    (total_tiles - num_bombs).times { tiles << Tile.new(false) }

    tiles.shuffle!

    @grid.each_with_index do |row, j|
      row.each_index do |k|
        tile = tiles.pop
        self[[j, k]] = tile
        tile.pos = [j, k]
      end
    end
  end

  def reveal_applicable(tile)
    tile.reveal
    return if tile.is_bomb

    neighbors = find_neighbors(tile)
    tile.fringe_val = neighbors.count(&:is_bomb)

    if tile.fringe_val == 0
      neighbors.each do |el|
        reveal_applicable(el) unless el.revealed || el.is_bomb
      end
    end

  end

  def find_neighbors(tile)
    @grid.flatten.select { |other_tile| tile.is_neighbor?(other_tile) }
  end

  def size
    @grid.length
  end

end
