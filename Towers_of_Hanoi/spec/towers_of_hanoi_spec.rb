require "towers_of_hanoi"
require "rspec"

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new(3) }

  describe "#initialize" do
    it "initializes first tower with disks in descending order" do
      expect(towers.first).to eq([3, 2, 1])
    end

    it "initializes second and third towers as empty arrays" do
      expect(towers.second).to be_empty
      expect(towers.third).to be_empty
    end

    context "when no size is given" do
      subject(:towers) { TowersOfHanoi.new }

      it "initializes first tower with 5 disks" do
        expect(towers.first).to eq([5, 4, 3, 2, 1])
      end
    end
  end

  describe '#make_move' do
    it "moves a disk from one tower to another tower" do
      towers.make_move(towers.first, towers.second)
      expect(towers.first).to eq([3, 2])
      expect(towers.second).to eq([1])
      towers.make_move(towers.second, towers.third)
      expect(towers.second).to eq([])
      expect(towers.third).to eq([1])
    end

    it "raises an error if starting tower is empty" do
      expect { towers.make_move(towers.second, towers.third) }.to raise_error("Invalid move!")
    end

    it "raises an error if moving disk is greater than ending tower's top disk" do
      towers.third << towers.first.pop
      towers.second << towers.first.pop
      expect { towers.make_move(towers.second, towers.third) }.to raise_error("Invalid move!")
    end
  end


  describe "#won?" do


    it "returns true if second or third tower has all the disks in proper order" do

      3.times { towers.second << towers.first.shift }
      expect(towers.won?).to be true
      3.times { towers.third << towers.second.shift }
      expect(towers.won?).to be true
    end

    it "returns false if second or third tower has all the disks in incorrect order" do
      3.times { towers.second << towers.first.pop }
      expect(towers.won?).to be false
      3.times { towers.third << towers.second.shift }
      expect(towers.won?).to be false
    end

    it "returns false if game is in process" do
      towers.second << towers.first.shift
      towers.third << towers.first.shift
      expect(towers.won?).to be false
    end
  end
end
