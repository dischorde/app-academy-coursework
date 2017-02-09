require 'set'


class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
    @dictionary = Set.new(@dictionary)
  end

  # def adjacent_words(word)
  #   @dictionary.select { |entry| entry != word && is_adjacent?(word, entry) }
  # end
  #
  # def is_adjacent?(word, entry)
  #   return false unless entry.length == word.length
  #   different_count = 0
  #   word.chars.each_with_index do |letter, idx|
  #     different_count += 1 unless entry[idx] == letter
  #     return false if different_count > 1
  #   end
  #   true
  # end

  def adjacent_words(word)
    # variable name *masks* (hides) method name; references inside
    # `adjacent_words` to `adjacent_words` will refer to the variable,
    # not the method. This is common, because side-effect free methods
    # are often named after what they return.
    adjacent_words = []

    # NB: I gained a big speedup by checking to see if small
    # modifications to the word were in the dictionary, vs checking
    # every word in the dictionary to see if it was "one away" from
    # the word. Can you think about why?
    word.each_char.with_index do |old_letter, i|
      ('a'..'z').each do |new_letter|
        # Otherwise we'll include the original word in the adjacent
        # word array
        next if old_letter == new_letter

        new_word = word.dup
        new_word[i] = new_letter

        adjacent_words << new_word if dictionary.include?(new_word)
      end
    end

    adjacent_words
  end

  def run(src, target)
    @current_words, @all_seen_words = [src], { src => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end
    build_path(target)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent|
        next if @all_seen_words.include?(adjacent)

        new_current_words << adjacent
        @all_seen_words[adjacent] = current_word
      end
    end

    @current_words = new_current_words
  end

  def build_path(target)
    return [] if target.nil?
    path = [target]
    new_target = @all_seen_words[target]
    build_path(new_target) + path
  end

end

if __FILE__ == $PROGRAM_NAME
  game = WordChainer.new("dictionary.txt")
  game.run("market", "goblet")
end
