require_relative "card"

class Deck
  attr_reader :pile

  def self.default_pile
    cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards
  end

  def initialize(pile = Deck::default_pile)
    @pile = pile
    shuffle_deck
  end

  def shuffle_deck
    @pile.shuffle!
  end

  def deal(number)
    dealt = []
    number.times { dealt << @pile.pop }
    dealt
  end


end
