require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder
  attr_reader :start_pos

  MOVES = [
    [1, 2],
    [2, 1],
    [-1, 2],
    [-2, 1],
    [-2, -1],
    [-1, -2],
    [1, -2],
    [2, -1]
  ]

  def initialize(start_pos = [0, 0])
    @start_pos = start_pos
    @visited_pos = [start_pos]
    @root = PolyTreeNode.new(@start_pos)
    build_move_tree
  end

  def self.valid_moves(pos)
    x, y = pos
    moves = MOVES.map { |step| [step[0] + x, step[1] + y] }
    moves.select { |mv| valid?(mv) }
  end

  def self.valid?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  def new_move_positions(pos)
    new_moves = self.class.valid_moves(pos).reject do |cur_pos|
      @visited_pos.include?(cur_pos)
    end
    @visited_pos += new_moves
    new_moves
  end

  def build_move_tree
    queue = [@root]

    until queue.empty?
      cur_node = queue.shift

      new_move_positions(cur_node.value).each do |child_pos|
        child_node = PolyTreeNode.new(child_pos)
        child_node.parent = cur_node
        queue << child_node
      end

    end
  end

  def find_path(end_pos)
    end_node = @root.dfs(end_pos)
    trace_path_back(end_node)

    # end_node = @root.bfs(end_pos)

  end

  def trace_path_back(node)
    paths = []
    cur_node


    paths
  end

end

if __FILE__ == $PROGRAM_NAME
  finder = KnightPathFinder.new

end
