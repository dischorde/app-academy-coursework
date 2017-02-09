require 'card.rb'
require 'rspec'

describe Card do
  subject(:card) { Card.new(11, :hearts) }

  describe "#initialize" do
    it "initializes with a value" do
      expect(card.value).to eq(11)
    end

    it "initializes with a suit" do
      expect(card.suit).to eq(:hearts)
    end
  end
end
