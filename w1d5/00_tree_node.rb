require 'byebug'
class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value, parent = nil, children = [])
    @parent = parent
    @children = children
    @value = value
  end

  def parent=(other_node)
    @parent.children.delete(self) if @parent
    @parent = other_node
    @parent.children << self unless other_node.nil? || @parent.children.include?(self)
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "not a child" unless @children.include?(child)
    child.parent = nil
  end

  def dfs(target)
    return self if self.value == target

    self.children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      cur = queue.shift
      return cur if cur.value == target
      cur.children.each { |child| queue.push(child) }
    end

    nil
  end

end
