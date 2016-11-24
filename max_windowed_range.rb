def windowed_max_range(array, window_size)
  max_range = nil
  array.each_index do |idx|
    window = array[idx, window_size]
    break if window.length < window_size
    range = window.max - window.min
    max_range = range if max_range.nil? || max_range < range
  end
  max_range
end
