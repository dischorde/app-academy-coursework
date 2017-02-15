require_relative "static_array"

class DynamicArray
  START_LENGTH = 8
  attr_reader :length

  def initialize
    @store = StaticArray.new(START_LENGTH)
    @capacity = START_LENGTH
    @length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
    @length += 1
  end

  # O(1)
  def pop
    check_emptiness
    @length -= 1
    @store[@length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    check_emptiness
    shifted = @store[0]

    (@length - 1).times do |idx|
      @store[idx] = @store[idx + 1]
    end

    @length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity

    @length.downto(1) do |idx| # emulating for loop with i--
      @store[idx] = @store[idx - 1]
    end

    @length += 1
    @store[0] = val
  end

  protected

  attr_accessor :capacity, :store
  attr_writer :length

  def check_emptiness
    raise "index out of bounds" if @length == 0
  end

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    new_store = StaticArray.new(@capacity)

    @length.times do |idx|
      new_store[idx] = @store[idx]
    end

    @store = new_store
  end
end
