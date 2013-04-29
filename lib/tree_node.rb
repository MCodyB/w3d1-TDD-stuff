class TreeNode
	attr_accessor :value, :children, :parent
	def initialize(value)
		@value = value
		@children = []
	end

	def add_child(node)
		@children << node
		node.parent = self
	end

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
			if nxt_node.value != value
	 			order += nxt_node.children
			else
				return nxt_node
			end
		end
	end

	def dfs(value)
	end
end
=begin
a = TreeNode.new(7)
b = TreeNode.new(5, a)
c = TreeNode.new(9, a)
d = TreeNode.new(2, b)
e = TreeNode.new(6, b)
f = TreeNode.new(8, c)
g = TreeNode.new(10, c)

a.bfs(7)
=end