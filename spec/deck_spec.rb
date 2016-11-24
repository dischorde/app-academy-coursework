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
      hearts, clubs, diamonds, spades = 0, 0, 0, 0
      deck.pile.each do |card|
        case card.suit
        when :hearts
          hearts += 1
        when :clubs
          clubs += 1
        when :spades
          spades += 1
        when :diamonds
          diamonds += 1
        end
      end

      counts = [spades, clubs, diamonds, hearts]
      expect(counts.all? { |el| el == 13 }).to be true
    end

    it "has 4 cards for each value" do
      hearts, clubs, diamonds, spades = [], [], [], []
      deck.pile.each do |card|
        case card.suit
        when :hearts
          hearts << card.value
        when :clubs
          clubs << card.value
        when :spades
          spades << card.value
        when :diamonds
          diamonds << card.value
        end
      end

      expect(hearts.sort).to eq((1..13).to_a)
      expect(clubs.sort).to eq((1..13).to_a)
      expect(diamonds.sort).to eq((1..13).to_a)
      expect(spades.sort).to eq((1..13).to_a)
    end
  end

  describe '#shuffle_deck' do
    it "shuffles the deck" do
      expect(deck.pile).to receive(:shuffle!)
      deck.shuffle_deck
    end
  end

  describe '#deal' do
    it "removes the number of cards from the pile" do
      deck.deal(3)
      expect(deck.pile.length).to eq(49)
    end

    it "returns an array of the dealt cards" do
      dealt = deck.deal(2)
      expect(dealt.length).to eq(2)
      expect(dealt).to be_an(Array)
    end
  end
end
