require_relative "card"

class Deck
  attr_reader :pile

  def initialize
    @pile = setup
    shuffle_deck
  end

  def setup
    cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards
  end

  def shuffle_deck
    @pile.shuffle!
  end


end
