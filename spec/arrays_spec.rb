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

		# it "should not call uniq" do
# 			A
# 		end
#
	end
end