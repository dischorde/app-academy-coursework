class BinaryMaxHeap
  def initialize(&prc)
    prc ||= self.class.default_prc

    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    raise "heap is empty" if @store.empty?
    self.class.extract(@store, count, @prc)
    @store.pop
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    self.class.sift_up(@store, count - 1, @prc)
  end

  def self.extract(arr, length, prc = default_prc)
    arr[0], arr[length - 1] = arr[length - 1], arr[0]
    sift_down(arr, 0, length - 1, prc)
  end

  def self.sift_up(arr, current, prc = default_prc)
    return arr if current == 0
    parent = parent_index(current)
    if prc.call(arr[current], arr[parent]) == 1
      arr[current], arr[parent] = arr[parent], arr[current]
      sift_up(arr, parent, prc)
    end
    arr
  end

  def self.sift_down(arr, current, len, prc = default_prc)
    children = child_indices(current, len) || []
    return arr if children.empty?
    larger_idx = children[0]

    if children[1] && prc.call(arr[children[1]], arr[children[0]]) == 1
      larger_idx = children[1]
    end

    if prc.call(arr[larger_idx], arr[current]) == 1
      arr[current], arr[larger_idx] = arr[larger_idx], arr[current]
      sift_down(arr, larger_idx, len, prc)
    end

    arr
  end

  def self.child_indices(idx, len)
    left = (idx * 2) + 1
    right = (idx * 2) + 2

    [left, right].select { |index| index < len }
  end

  def self.parent_index(idx)
    raise "root has no parent" if idx == 0
    (idx - 1) / 2
  end

  def self.default_prc
    Proc.new { |el1, el2| el1 <=> el2 }
  end
end
