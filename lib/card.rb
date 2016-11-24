class Card
  attr_reader :value, :suit

  SUITS = [:hearts, :clubs, :spades, :diamonds]
  VALUES = (1..13).to_a

  def initialize(value, suit)
    @value = value
    @suit = suit
  end
end
