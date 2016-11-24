def bad_two_sum?(array, target_sum)
  (array.length - 1).times do |idx1|
    ((idx1 + 1)...array.length).each do |idx2|
      return true if array[idx1] + array[idx2] == target_sum
    end
  end
  false
end

def okay_two_sum_v1?(array, target_sum)
  sorted = array.sort
  two_sum_rec?(sorted, target_sum)
end

def okay_two_sum_v2?(array, target_sum)
  sorted = array.sort

  sorted.each_with_index do |num, idx|
    desired_num = target_sum - num
    return true if bsearch(sorted[(idx + 1)..-1], desired_num)
  end

  false
end

def bsearch(nums, target)
  return false if nums.empty?

  middle = nums.length / 2
  case target <=> nums[middle]
  when -1
    bsearch(nums.take(middle), target)
  when 0
    true
  when 1
    bsearch(nums.drop(middle + 1), target)
  end
end


def two_sum_rec?(array, target_sum)
  return false if array.length < 2

  sum = array.first + array.last

  case sum <=> target_sum
  when -1
    two_sum_rec?(array[1..-1], target_sum)
  when 0
    return true
  when 1
    two_sum_rec?(array[0..-2], target_sum)
  end
end

def pair_sum?(array, target_sum)
  nums = Hash.new(0)
  array.each do |num|
    nums[num] += 1
  end

  nums.keys.each do |num|
    need = target_sum - num
    if need == num
      return true if nums[num] > 1
    elsif nums.key?(need)
      return true
    end
  end

  false
end
