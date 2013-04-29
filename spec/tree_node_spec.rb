require 'rspec'
require 'tree_node'


describe TreeNode do
	let(:node) {TreeNode.new(7)}

	describe "#initialize" do
		it "initializes with a value" do
			node.value.should == 7
		end

		it "initializes base node with nil parent" do
			node.parent.should == nil
		end

		it "initializes with no children" do
			node.children.should be_empty
		end
	end

	describe "#add_child" do

		it "adds child objects to parent's children array" do
			node.add_child(TreeNode.new(5)).children.size == 1
		end

		it "can have multiple children to a parent" do
			node.add_child(TreeNode.new(7)).children.size == 2
		end
	end

	describe "#bfs" do
		let(:node) do
			root = TreeNode.new(7)
			root.add_child(TreeNode.new(5))
			root.add_child(TreeNode.new(9))
			root.children[0].add_child(TreeNode.new(2))
			root.children[0].add_child(TreeNode.new(6))
			root.children[1].add_child(TreeNode.new(8))
			root.children[1].add_child(TreeNode.new(10))
		end

		it "returns node with given value" do
			node.bfs(8).value.should == 8
		end

		it "searches across node levels" do

			node.children[1].should_receive(:value).and_call_original.ordered
			node.children[0].children[1].should_receive(:value).and_call_original.ordered
			node.bfs(8)
		end


	end


end