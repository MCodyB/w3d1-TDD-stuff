class TreeNode
	#REV Looks good to me
	attr_accessor :value, :children, :parent
	def initialize(value)
		@value = value
		@children = []
	end

	def add_child(node)
		@children << node
		node.parent = self
	end

	# REV Like the use of the splat. Faster and more humane
	 #than iterating through and shoving the children down the line.
	def bfs_iter(value, order=[])
		return self if self.value == value
		order.push(*@children)
		next_node = order.shift
		next_node.bfs(value, order)
		# if b.value != value
# 			order.push(*b.children)
	end

	def next_node(array)
		array.shift
	end

	def bfs(value)
		return self if self.value == value
		order = []
		order += @children
		until order.empty?
			nxt_node = next_node(order)
			#p nxt_node.value
			if nxt_node.value != value
	 			order += nxt_node.children
			else
				return nxt_node
			end
		end
	end

	def dfs(value)
		if self.value == value
			return self
		else
			result = nil
			@children.each do |child|
				result = child.dfs(value) if (child && result.nil?)
			end
		end
		result
	end
end
=begin
root = TreeNode.new(7)
root.add_child(TreeNode.new(5))
root.add_child(TreeNode.new(9))
root.children[0].add_child(TreeNode.new(2))
root.children[0].add_child(TreeNode.new(6))
root.children[1].add_child(TreeNode.new(8))
root.children[1].add_child(TreeNode.new(10))
root.dfs(7)
=end