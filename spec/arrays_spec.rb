require 'rspec'
require 'arrays'

describe Array do
	describe "#my_uniq" do
		it "returns empty array if given empty array" do
			[].my_uniq.should == []
		end

		it "returns same array if no dups are found" do
			[1,2,3].my_uniq.should == [1,2,3]
		end

		it "returns array without dups if dups are found" do
			[1,2,3,1].my_uniq.should == [1,2,3]
		end

		it "should not call uniq" do
			should_not_receive(:uniq)
		end
	end

	describe "#two_sum?" do
		it "returns false on empty array" do
			[].two_sum?.should == false
		end

		it "returns false if size < 2" do
			[0].two_sum?.should == false
		end

		it "returns false if no two sum to zero" do
			[1,2,3].two_sum?.should == false
		end

		it "returns true if two numbers sum to zero" do
			[1,2,3,-2].two_sum?.should == true
		end

		it "returns false if has only one zero" do
			[1,2,3,0].two_sum?.should == false
		end
	end
end

describe TowersOfHanoi do
  let(:towers) {TowersOfHanoi.new}

	describe "stacks" do
		it "contains 3 arrays" do
		 towers.stacks.size.should == 3
	 	end

		it "first stack has 3 disks" do
			towers.stacks[0].size.should == 3
		end
	end

	describe "#moves" do
		it "moves from one stack to the other" do
			towers.move(0,2)
			towers.stacks.should == [[3, 2], [], [1]]
		end

		it "cannot move bigger disk onto smaller disk" do
			towers.move(0,2)
			towers.stacks.should_not == [[3], [], [1, 2]]
		end

		it "can move small disk onto bigger disk" do
			towers.move(0,2)
			towers.move(2,0)
			towers.stacks.should == [[3,2,1], [], []]
		end
	end

	describe "#render" do
		it "returns a string of stacks" do
			towers.render.should == "[[3, 2, 1], [], []]"
		end

		it "renders after a move" do
			towers.move(0,2)
			towers.render.should == "[[3, 2], [], [1]]"
		end
	end

	describe "#won?" do
		it "returns false if first stack is empty but the size of others is not full" do
			towers.stacks = [[], [1], [3,2]]
			towers.should_not be_won
		end

		it "returns false if first stack full" do
			towers.stacks = [[3,2,1], [], []]
			towers.should_not be_won
		end
		it "returns true if second stack full" do
			towers.stacks = [[], [3,2,1], []]
			towers.should be_won
		end
		it "returns true if third stack full" do
			towers.stacks = [[], [], [3,2,1]]
			towers.should be_won
		end
	end

	describe "#play" do
		it "loop can be won" do
			win_moves = [[0,2], [0,1], [2,1], [0,2], [1,0], [1,2], [0,2]]
			towers.stub(:s_and_t).and_return(*win_moves)

			towers.should_receive(:move).exactly(7).times.and_call_original
			towers.play
		end
	end
end