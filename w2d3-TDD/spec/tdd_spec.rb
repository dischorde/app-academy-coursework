require "tdd.rb"
require 'rspec'

describe Array do
  subject(:arr) { [1,2,1,3,3] }

  describe "#my_uniq" do
    it "removes duplicates" do
      expect(arr.my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    context "when there is a zero sum" do
      subject(:arr) { [-1, 0, 2, -2, 1] }

      it "returns pairs in proper order" do
        expect(arr.two_sum).to eq([[0, 4], [2, 3]])
      end
    end

    context "when there is no zero sum" do
      it "returns an empty array" do
        expect(arr.two_sum).to eq([])
      end
    end
  end

  describe "#my_transpose" do
    let(:rectangular) { [ [1, 2, 3], [4, 5, 6] ]}
    let(:square) {[ [0, 1, 2], [3, 4, 5], [6, 7, 8] ]}

    it "transposes a rectangular array" do
      expect(rectangular.my_transpose).to eq([ [1,4], [2,5], [3,6] ])
    end

    it "transposes a square arary" do
      expect(square.my_transpose).to eq([ [0, 3, 6], [1, 4, 7], [2, 5, 8] ])
    end
  end

  describe '#stock_picker' do
    context "with a profitable stock" do
      subject(:stocks) { [[0, 14], [1, 20], [2, 22], [3, 15], [4, 17],
        [5, 25], [6, 12]] }

      it "chooses the most profitable pair of days" do
        expect(stocks.stock_picker).to eq([0, 5])
      end
    end

    context "with a nonprofitable stock" do
      subject(:stocks) {[ [0, 14], [1, 13], [2, 12], [3, 11], [4, 10],
        [5, 9], [6, 8]] }

      it "returns an empty array" do
        expect(stocks.stock_picker).to be_empty
      end
    end

  end

end
