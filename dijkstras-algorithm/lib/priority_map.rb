require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    @map = Hash.new
    @queue = BinaryMinHeap.new do |key1, key2|
      prc.call(self.map[key1], self.map[key2])
    end
  end

  def [](key)
    @map[key]
  end

  def []=(key, value)
    if @map[key]
      update(key, value)
    else
      insert(key, value)
    end
  end

  def count
    @queue.count
  end

  def empty?
    @queue.empty?
  end

  def extract
    min_key = @queue.extract
    min_val = @map.delete(min_key)
    [min_key, min_val]
  end

  def has_key?(key)
    @map.key?(key)
  end

  protected

  attr_accessor :map, :queue

  def insert(key, value)
    @map[key] = value
    @queue.push(key)
  end

  def update(key, value)
    @map[key] = value
    @queue.reduce!(key)
  end
end
