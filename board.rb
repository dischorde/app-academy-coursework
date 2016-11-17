require_relative 'tile.rb'

class Board

  def initialize(grid_size = 9)
    @grid = Array.new(grid_size) { Array.new(grid_size) }
    populate
  end

  def won?
  end

  def render
    puts "   #{(0...size).to_a.map.join(' ')}"
    @grid.each.with_index do |row, idx|
      puts "#{idx} #{row.map(&:to_s).join(' ')}"
    end
  end

  def populate
    tiles = []
    total_tiles = size**2
    num_bombs = total_tiles / 5
    num_bombs.times { tiles << Tile.new(true) }
    (total_tiles - num_bombs).times { tiles << Tile.new(false) }

    tiles.shuffle!

    @grid.each do |row|
      row.map { tiles.pop }
    end
  end

  def size
    @grid.length
  end

end
