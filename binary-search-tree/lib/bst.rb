class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root
      self.class.insert!(@root, value)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value)
    self.class.find!(@root, value)
  end

  def inorder
    self.class.inorder!(@root)
  end

  def postorder
    self.class.postorder!(@root)
  end

  def preorder
    self.class.preorder!(@root)
  end

  def height
    self.class.height!(@root)
  end

  def min
    self.class.min(@root)
  end

  def max
    self.class.max(@root)
  end

  def delete(value)
    self.class.delete!(@root, value)
  end

  def self.insert!(node, value)
    if node.nil?
      return BSTNode.new(value)
    elsif value <= node.value
      node.left = insert!(node.left, value)
    else
      node.right = insert!(node.right, value)
    end

    node
  end

  def self.find!(node, value)
    return nil unless node
    if node.value == value
      node
    elsif value < node.value
      find!(node.left, value)
    else
      find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] unless node

    ordered = [node.value]
    ordered += preorder!(node.left)
    ordered += preorder!(node.right)

    ordered
  end

  def self.inorder!(node)
    return [] unless node

    ordered = inorder!(node.left)
    ordered << node.value
    ordered += inorder!(node.right)

    ordered
  end

  def self.postorder!(node)
    return [] unless node

    ordered = postorder!(node.left)
    ordered += postorder!(node.right)
    ordered << node.value

    ordered
  end

  def self.height!(node)
    return -1 unless node
    left = 1 + height!(node.left)
    right = 1 + height!(node.right)
    left > right ? left : right
  end

  def self.max(node)
    return nil unless node

    if node.right
      return max(node.right)
    end

    node
  end

  def self.min(node)
    return nil unless node

    if node.left
      return min(node.left)
    end

    node
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left

    node.left = delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node

    if node.value == value
      return node.right unless node.left
      return node.left unless node.right

      replacement = node.right.min
      replacement.right = delete_min!(node.right)
      replacement.left = node.left
      return replacement
    elsif value < node.value
      node.left = delete!(node.left, value)
    else
      node.right = delete!(node.right, value)
    end

    node
  end
end
