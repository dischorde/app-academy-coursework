require 'byebug'

def range(min, max)
  return [] if max < min
  [min] + range(min + 1, max)
end

def range_iter(min, max)
  return [] if max < min
  n = min
  final_range = []
  until n > max
    final_range << n
    n += 1
  end
  final_range
end

def sum_array_iter(nums)
  sum = 0
  nums.each { |el| sum += el }
  sum
end

def sum_array(nums)
  return 0 if nums.empty?
  nums.first + sum_array(nums[1..-1])
end

def exponent_1(num, exp)
  return 1 if exp == 0
  num * exponent_1(num, exp - 1)
end

# def exponent_2(num, exp)
#   return 1 if exp == 0
#   return num if exp == 1
#   if exp.even?
#     new_num = exponent_2(num, exp / 2)
#     new_num * new_num
#   else
#     new_num = exponent_2(num, (exp - 1) / 2)
#     num * new_num * new_num
#   end
# end

#SOLUTION:
def exp2(base, power)
  return 1 if power == 0

  half = exp2(base, power / 2)

  if power.even?
    half * half
  else
    # note that (power / 2) == ((power - 1) / 2) if power.odd?
    base * half * half
  end
end

def deep_dup(arr)
  duplicate = []
  arr.each do |el|
    if el.is_a?(Array)
      duplicate << deep_dup(el)
    else
      duplicate << el
    end
  end
  duplicate
end

#ONE LINE SOLUTIONS
def dd_inject
  inject([]) { |dup, el| dup << (el.is_a?(Array) ? dd_inject(el) : el) }
end

# Beware map! The ultimate one-liner.
def dd_map
  map { |el| el.is_a?(Array) ? dd_map(el) : el }
end

def fibonacci_iter(n)
  return [] if n == 0
  return [0] if n == 1
  fibs = [0, 1]

  until fibs.length > n
    fibs << (fibs[-2] + fibs[-1])
  end
  fibs
end

def fibonacci(n)
  return [0, 1].take(n) if n <= 2
  previous = fibonacci(n - 1)
  previous << (previous[-2] + previous[-1])
end

def permutations(arr)
  return [arr] if arr.length <= 1

  perms = permutations(arr[0..-2])
  digit = arr[-1]
  all_perms = []

  (0...arr.length).each do |idx|
    perms.each do |subarray|
      all_perms << subarray[0...idx] + [digit] + subarray[idx..-1]
      # all_perms << subarray.dup.insert(idx, digit)
    end
  end
  all_perms
end

#bsearch solution which is totally cool
# def bsearch(nums, target)
#   # nil if not found; can't find anything in an empty array
#   return nil if nums.empty?
#
#   probe_index = nums.length / 2
#   case target <=> nums[probe_index]
#   when -1
#     # search in left
#     bsearch(nums.take(probe_index), target)
#   when 0
#     probe_index # found it!
#   when 1
#     # search in the right; don't forget that the right subarray starts
#     # at `probe_index + 1`, so we need to offset by that amount.
#     sub_answer = bsearch(nums.drop(probe_index + 1), target)
#     (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
#   end
#
#   # Note that the array size is always decreasing through each
#   # recursive call, so we'll either find the item, or eventually end
#   # up with an empty array.
# end


def bsearch(array, target)
  return nil if array.length <= 1 && array[0] != target

  mid_idx = (array.length - 1) / 2
  if array[mid_idx] == target
    mid_idx
  elsif array[mid_idx] < target
    response = bsearch(array[(mid_idx + 1)..-1], target)
    response.nil? ? nil : response + mid_idx + 1
  else
    bsearch(array[0...mid_idx], target)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = (arr.length - 1) / 2

  arr1 = merge_sort(arr[0..mid])
  arr2 = merge_sort(arr[(mid + 1)..-1])

  merge(arr1, arr2)
end

#SOLUTION
def merge(left, right)
  merged_array = []
  until left.empty? || right.empty?
    merged_array <<
      ((left.first < right.first) ? left.shift : right.shift)
  end

  merged_array + left + right
end

# def merge(arr1, arr2)
#   merged = []
#   (arr1.length + arr2.length).times do
#     if arr1.empty?
#       return merged + arr2
#     elsif arr2.empty?
#       return merged + arr1
#     elsif arr1[0] > arr2[0]
#       merged << arr2.shift
#     else
#       merged << arr1.shift
#     end
#   end
#   merged
# end

def subsets(arr)
  return [[]] if arr.empty?
  subsets_arr = []
  cur_el = arr[0]
  prior_subs = subsets(arr[1..-1])
  prior_subs.each do |subset|
    subsets_arr << subset.dup.push(cur_el)
  end
  subsets_arr + prior_subs
end

#SOLUTION
# def subsets(arr)
#   return [[]] if arr.empty?
#   subs = subsets(arr.take(arr.count - 1))
#   subs.concat(subs.map { |sub| sub + [arr.last] })
# end

def greedy_make_change(amt, coins)
  return [] if target == 0
  return nil if coins.none? { |coin| coin <= target }
  return [amt] if coins.include?(amt)
  best_coin = coins.reject { |coin| coin > amt }.max
  remaining = amt - best_coin
  [best_coin] + greedy_make_change(remaining, coins)
end

def make_better_change(amt, coins)
  return [amt] if coins.include?(amt)
  return [] if amt == 0
  best_answer = nil
  valid_coins = coins.reject { |coin| coin > amt}
  valid_coins.each do |coin|
    other_coins = make_better_change((amt - coin), coins)
    next if other_coins.nil?
    potential_answer = [coin] + other_coins
    best_answer = potential_answer if best_answer.nil? || potential_answer.length < best_answer.length
  end
  best_answer
end
