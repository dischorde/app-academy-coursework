class BinaryMaxHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    raise "heap is empty" if @store.empty?
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    extracted = @store.pop
    sift_down(0)
    extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    sift_up(count - 1)
  end

  private

  def sift_up(current)
    return @store if current == 0
    parent = parent_index(current)
    if @store[current] > @store[parent]
      @store[current], @store[parent] = @store[parent], @store[current]
      sift_up(parent)
    end
    @store
  end

  def sift_down(current)
    children = child_indices(current) || []
    return @store if children.empty?
    larger_idx = children[0]

    if children[1] && @store[children[1]] > @store[children[0]]
      larger_idx = children[1]
    end

    if @store[current] < @store[larger_idx]
      @store[current], @store[larger_idx] = @store[larger_idx], @store[current]
      sift_down(larger_idx)
    end

    @store
  end

  def child_indices(idx)
    left = (idx * 2) + 1
    right = (idx * 2) + 2

    [left, right].select { |index| index < count }
  end

  def parent_index(idx)
    raise "root has no parent" if idx == 0
    (idx - 1) / 2
  end
end
