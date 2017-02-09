def first_anagram?(string1, string2)
  # O(n!)
  string1.chars.permutation.to_a.include?(string2.chars)
end

def second_anagram?(string1, string2)
  # O(n^2)
  letters1 = string1.chars
  letters2 = string2.chars
  to_delete = []

  letters1.each do |letter1|
    letters2.each do |letter2|
      to_delete << letter1 if letter1 == letter2
    end
  end

  to_delete.each do |letter|
    letters1.delete(letter)
    letters2.delete(letter)
  end

  letters1.empty? && letters2.empty?
end

def third_anagram?(string1, string2)
  # O(nlogn)
  string1.chars.sort == string2.chars.sort
end

def fourth_anagram?(string1, string2)
  # O(n)
  string1_freq = Hash.new(0)
  string2_freq = Hash.new(0)

  string1.chars.each { |letter| string1_freq[letter] += 1 }
  string2.chars.each { |letter| string2_freq[letter] += 1 }

  string1_freq == string2_freq
end

def fifth_anagram?(string1, string2)
  # O(n)
  string1_freq = Hash.new(0)

  string1.chars.each { |letter| string1_freq[letter] += 1 }
  string2.chars.each { |letter| string1_freq[letter] -= 1 }

  string1_freq.values.all? { |freq| freq == 0 }
end


def another_anagram?(string1, string2)
  # O(n^2)
  string1_freq = Hash.new(0)
  string2_chars = string2.chars

  string1.chars.each { |letter| string1_freq[letter] += 1 }

  string2_chars.each do |letter|
    return false unless string2_chars.count(letter) == string1_freq[letter]
  end

  true
end
