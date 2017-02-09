class Array
  def my_uniq
    uniques = []
    self.each { |el| uniques << el unless uniques.include?(el) }
    uniques
  end

  def two_sum
    indicies = []
    self.each_with_index do |el, idx|
      break if idx == self.length - 1
      ((idx + 1)...self.length).each do |idx2|
        indicies << [idx, idx2] if self[idx] + self[idx2] == 0
      end
    end
    indicies
  end

  def my_transpose
    transposed = []
    self.first.length.times do |i|
      subarrays = []
      self.each do |el|
        subarrays << el[i]
      end
      transposed << subarrays
    end
    transposed
  end

  def stock_picker
    sorted_stocks = self.sort_by { |(day, price)| day }
    max_day = sorted_stocks.max_by { |(day, price)| price }
    return [] if max_day == sorted_stocks.first
    max_idx = sorted_stocks.index(max_day)
    min_day = sorted_stocks[0...max_idx].min_by { |(day, price)| price }
    [min_day.first, max_day.first]
  end
end
