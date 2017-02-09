require_relative "deck"


class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def beat_hand?(other_hand)
  end

  def kind_of_hand
    values = @cards.map { |card| card.value }.sort
    if is_straight?(values)
      return :straight
    else
      return values.max
    end
  end

  def is_straight?(values)
    (values.length - 1).times do |idx|
      return false unless values[idx + 1] - values[idx] == 1
    end
    true
  end

end
