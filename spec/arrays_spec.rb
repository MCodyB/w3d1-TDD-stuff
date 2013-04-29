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