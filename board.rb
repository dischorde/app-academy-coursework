class Board
  def initialize
    @grid = default_grid
  end

  def default_grid
    empty_grid = Array.new(8) { Array.new(8) }
    empty_grid.each_with_index do |row, row_num|
      row.each do |col|
        if row_num < 2 || row_num > 5
          @grid[row][col] = Piece.new
        else
          @grid[row][col] = nil
        end
      end
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

  def move_piece(start_pos, end_pos)
    current_piece = @grid[start_pos]
    raise "No piece to move." if current_piece.nil? #current_piece.is_a? NullPiece current
    raise "Piece cannot move there." unless @grid[end_pos].nil? #unless current_piece.valid_move?(end_pos)
    @grid[end_pos] = current_piece
    @grid[start_pos] = nil #TODO: NullPiece
  end
end
