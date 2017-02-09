class Board

  def self.from_file(file_name)
    rows = File.readlines(file_name).map(&:chomp)
    numbers = rows.map(&:chars).map(&:to_i)
    grid = []

    numbers.each do |row|
      grid << row.map(&:to_i)
    end

    Board.new(grid)
  end

  def initialize(grid)
    @grid = grid
  end

#Array.new(9) { Array.new(9) }

end
