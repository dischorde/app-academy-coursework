require_relative "static_array"

class RingBuffer
  START_LENGTH = 8
  attr_reader :length

  def initialize
    @store = StaticArray.new(START_LENGTH)
    @capacity = START_LENGTH
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[real_idx(index)]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[real_idx(index)] = val
    @length += 1
  end

  # O(1)
  def pop
    check_emptiness
    popped_off = @store[real_idx(@length - 1)]
    @length -= 1
    popped_off
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[real_idx(@length)] = val
    @length += 1
  end

  # O(1)
  def shift
    check_emptiness
    shifted = @store[@start_idx]
    @start_idx += 1
    @length -= 1
    shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @length += 1
    @start_idx -= 1
    @store[@start_idx] = val # start_idx is a real index
  end

  protected

  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def real_idx(idx)
    (idx + @start_idx) % @capacity
  end

  def check_emptiness
    raise "index out of bounds" if @length == 0
  end

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def resize!
    new_capacity = @capacity * 2
    new_store = StaticArray.new(new_capacity)

    @length.times do |idx|
      new_store[idx] = @store[real_idx(idx)]
    end

    @start_idx = 0
    @capacity = new_capacity
    @store = new_store
  end
end
