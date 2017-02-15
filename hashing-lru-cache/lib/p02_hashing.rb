class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0

    self.each_with_index do |el, idx|
      el = el.hash
      sum += el ^ (10**idx)
    end

    sum.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end
