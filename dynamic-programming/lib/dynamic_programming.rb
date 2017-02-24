# Dynamic Programming practice
# NB: you can, if you want, define helper functions to create the necessary caches as instance variables in the constructor.
# You may find it helpful to delegate the dynamic programming work itself to a helper method so that you can
# then clean out the caches you use.  You can also change the inputs to include a cache that you pass from call to call.

class DPProblems
  def initialize
    @fibs_cache = { 1 => 1, 2 => 1 }
    # Use this to create any instance variables you may need
  end

  # Takes in a positive integer n and returns the nth Fibonacci number
  # Should run in O(n) time
  def fibonacci(n)
    return nil if n < 1
    return @fibs_cache[n] if @fibs_cache[n]
    ans = fibonacci(n - 1) + fibonacci(n - 2)
    @fibs_cache[n] = ans
  end

  # Make Change: write a function that takes in an amount and a set of coins.  Return the minimum number of coins
  # needed to make change for the given amount.  You may assume you have an unlimited supply of each type of coin.
  # If it's not possible to make change for a given amount, return nil.  You may assume that the coin array is sorted
  # and in ascending order.

  #pseudo code:
  # return amt if its in the cache
  # return infinity if the amount is less than the smallest coin
  # set the answer to start as infinity
  # go through each coin
    # break if the coin is too big
    # set num coins to 1 for current coin plus change for the remaining amount
    # set ans to num coins unless num_coins is bigger than current (valid) ans
  # return and cache the ans if it is an Integer, otherwise set to infinity
  
  def make_change(amt, coins, coin_cache = { 0 => 0 })
    return coin_cache[amt] if coin_cache[amt]
    return 0.0 / 0.0 if amt < coins[0]

    ans = 0.0 / 0.0
    coins.each do |coin|
      break if coin > amt
      num_coins = 1 + make_change(amt - coin, coins, coin_cache)
      ans = num_coins unless ans.is_a?(Integer) && num_coins > ans
    end

    coin_cache[amt] = ans.is_a?(Integer) ? ans : 0.0 / 0.0
  end

  # Knapsack Problem: write a function that takes in an array of weights, an array of values, and a weight capacity
  # and returns the maximum value possible given the weight constraint.  For example: if weights = [1, 2, 3],
  # values = [10, 4, 8], and capacity = 3, your function should return 10 + 4 = 14, as the best possible set of items
  # to include are items 0 and 1, whose values are 10 and 4 respectively.  Duplicates are not allowed -- that is, you
  # can only include a particular item once.
  def knapsack(weights, values, capacity)
  end

  # Stair Climber: a frog climbs a set of stairs.  It can jump 1 step, 2 steps, or 3 steps at a time.
  # Write a function that returns all the possible ways the frog can get from the bottom step to step n.
  # For example, with 3 steps, your function should return [[1, 1, 1], [1, 2], [2, 1], [3]].
  # NB: this is similar to, but not the same as, make_change.  Try implementing this using the opposite
  # DP technique that you used in make_change -- bottom up if you used top down and vice versa.
  def stair_climb(n)
  end

  # String Distance: given two strings, str1 and str2, calculate the minimum number of operations to change str1 into
  # str2.  Allowed operations are deleting a character ("abc" -> "ac", e.g.), inserting a character ("abc" -> "abac", e.g.),
  # and changing a single character into another ("abc" -> "abz", e.g.).
  def str_distance(str1, str2)
  end

  # Maze Traversal: write a function that takes in a maze (represented as a 2D matrix) and a starting
  # position (represented as a 2-dimensional array) and returns the minimum number of steps needed to reach the edge of the maze (including the start).
  # Empty spots in the maze are represented with ' ', walls with 'x'. For example, if the maze input is:
  #            [['x', 'x', 'x', 'x'],
  #             ['x', ' ', ' ', 'x'],
  #             ['x', 'x', ' ', 'x']]
  # and the start is [1, 1], then the shortest escape route is [[1, 1], [1, 2], [2, 2]] and thus your function should return 3.
  def maze_escape(maze, start)
  end
end
