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

	it "places initial white piece" do
		board.grid[3][3].should == :white
	end
	it "places second white piece" do
		board.grid[4][4].should == :white
	end
	it "places initial black piece" do
		board.grid[3][4].should == :black
	end
	it "places initial white piece" do
		board.grid[4][3].should == :black
	end
end

describe Piece do
end

describe Game do
end
