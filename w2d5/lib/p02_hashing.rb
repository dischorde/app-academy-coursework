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
    letters = self.chars
    letters.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sorted_arr = self.to_a.sort
    ridiculous = sorted_arr.flatten.map do |el|
      el.is_a?(Symbol) ? el.to_s.hash : el.hash
    end
    ridiculous.hash
  end
end
