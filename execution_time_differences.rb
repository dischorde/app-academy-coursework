def my_min1(arr)
  arr.each_with_index do |el1, j|
    is_smallest = true
    arr.each_with_index do |el2, k|
      next if j == k
      is_smallest = false if el2 < el1
    end
    return el1 if is_smallest
  end
end
