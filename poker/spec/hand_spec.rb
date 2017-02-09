require 'hand.rb'
require 'rspec'

describe Hand do
  # let(:card1) { double("card1") }
  # let(:card2) { double("card2") }
  # let(:card3) { double("card3") }
  # let(:card4) { double("card4") }
  # let(:card5) { double("card5") }
  # subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }

  describe '#initialize' do
    let(:card) { double("card") }
    subject(:hand) { Hand.new([card, card, card, card, card]) }

    it "should have an array of 5 cards" do
      allow(card).to receive(:is_a?).with(Card).and_return(true)
      expect(hand.cards.length).to eq(5)
      expect(hand.cards.all? { |card| card.is_a? Card }).to be true
    end
  end

  describe '#kind_of_hand' do
    context 'when there is a good hand' do
      let(:card1) { double("card1", :value => 7, :suit => :hearts) }
      let(:card2) { double("card2", :value => 8, :suit => :spades) }
      let(:card3) { double("card3", :value => 9, :suit => :hearts) }
      let(:card4) { double("card4", :value => 10, :suit => :diamonds) }
      let(:card5) { double("card5", :value => 11, :suit => :clubs) }
      subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }

      it "returns the kind of hand" do
        expect(hand.kind_of_hand).to eq(:straight)
      end
    end

    context 'where there is No Pair' do
      let(:card1) { double("card1", :value => 7, :suit => :hearts) }
      let(:card2) { double("card2", :value => 2, :suit => :spades) }
      let(:card3) { double("card3", :value => 9, :suit => :hearts) }
      let(:card4) { double("card4", :value => 10, :suit => :diamonds) }
      let(:card5) { double("card5", :value => 11, :suit => :clubs) }
      subject(:hand) { Hand.new([card1, card2, card3, card4, card5]) }

      it "returns the highest card" do
        expect(hand.kind_of_hand).to eq(11)
      end
    end
  end


end
