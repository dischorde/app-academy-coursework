class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left, right = [], []
    (1...array.length).each do |idx|
      if array[idx] < pivot
        left << array[idx]
      else
        right << array[idx]
      end
    end
    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 2
    pivot_idx = partition(array, start, length, &prc)

    left_len = pivot_idx - start
    right_len = length - 1 - left_len

    sort2!(array, 0, left_len, &prc) # sort left
    sort2!(array, pivot_idx + 1, right_len, &prc) # sort right

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # random between start and length + start - 1
    # random_pivot = start + rand(length - 1)
    # move random pivot to starting element
    # array[start], array[random_pivot] = array[random_pivot], array[start]

    wall = start + 1
    (wall...(start + length)).each do |idx|
      next unless prc.call(array[start], array[idx]) > 0
      array[wall], array[idx] = array[idx], array[wall]
      wall += 1
    end
    pivot_idx = wall - 1
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end

end
