require 'rspec'
require 'reversi'

describe Board do
  let(:board) {Board.new}
	describe "#initialize"
	it "returns a grid with 8 rows" do
		board.grid.size.should == 8
	end

	it "has rows 8 long" do
		board.grid[rand(0..7)].size.should == 8
	end

	it "places"
end

describe Piece do
end

describe Game do
end
