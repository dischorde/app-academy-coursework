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

def my_min2(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end
  min
end

def largest_contiguous_sub1(arr)
  subs = []
  arr.each_index do |idx1|
    (idx1...arr.length).each do |idx2|
      subs << arr[idx1..idx2]
    end
  end
  subs.map { |array| array.inject(:+) }.max
end

def largest_contiguous_sub2(arr)
  return arr.max if arr.all? { |el| el < 0 }
  max_max = nil
  cur_sum = 0
  arr.each do |el|
    if max_max.nil? && el > 0
      max_max = el
    end
    cur_sum += el
    if cur_sum > 0
      max_max = cur_sum if cur_sum > max_max
    else
      cur_sum = 0
    end
  end
  max_max

end
