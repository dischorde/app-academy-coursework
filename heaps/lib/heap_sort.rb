require_relative "heap"
require_relative "max_heap"

class Array
  def min_heap_sort!
    (2..self.length).each do |length|
      BinaryMinHeap.heapify_up(self, length - 1, length)
    end

    self.length.downto(2) do |length|
      self[length - 1], self[0] = self[0], self[length - 1]
      BinaryMinHeap.heapify_down(self, 0, length - 1)
    end

    self.reverse!
  end

  def heap_sort!
    mid = length / 2
    mid.downto(0) do |idx|
      BinaryMaxHeap.sift_down(self, idx, self.length)
    end

    self.length.downto(1) do |len|
      BinaryMaxHeap.extract(self, len)
    end
  end
end
