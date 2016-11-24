require 'deck.rb'
require 'rspec'

describe Deck do
  subject(:deck) { Deck.new }


  describe "#initialize" do
    it "initializes deck pile to be an array of 52 slots" do
      expect(deck.pile.length).to eq(52)
    end

  end

  describe '#setup' do
    it "has 13 cards of each suit" do
      hearts = deck.pile.count { |card| card.suit == :hearts }
      clubs = deck.pile.count { |card| card.suit == :clubs }
      diamonds = deck.pile.count { |card| card.suit == :diamonds }
      spades = deck.pile.count { |card| card.suit == :spades }
      counts = [spades, clubs, diamonds, hearts]

      expect(counts.all? { |el| el == 13 }).to be true
    end
  end

  describe '#shuffle_deck' do
    it "shuffles the deck" do
      expect(deck.pile).to receive(:shuffle!)
      deck.shuffle_deck
    end
  end

end
