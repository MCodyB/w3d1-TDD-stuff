class Array

	def my_uniq
		unique = []
		self.each do |el|
			unique << el unless unique.include?(el)
		end
		unique
	end

	def two_sum?
		self.each_with_index do |x, i|
			self.each_with_index do |y, j|
				if x + y == 0 && i != j
					return true
				end
			end
		end

		false
	end

	def my_transpose #fix it
		transposed_arr = Array.new(self.size) {Array.new(self.size)}
		self.size.times do |col|
			col.size.times do |row|
				transposed_arr[col] << self[row][col]
			end
		end
		transposed_arr
	end


end

class TowersOfHanoi
	attr_accessor :stacks
	def initialize
		@stacks = [[3, 2, 1], [], []]
	end

	# REV These conditions might look a bit cleaner if they were on seperate lines. Or maybe 
	# put them into a seperate valid_move? method and check validity before moving?
	def move(start, target)
		if !(@stacks[start].empty?) || @stacks[target].empty? || @stacks[start].last < @stacks[target].last
			@stacks[target] << @stacks[start].pop
		end
	end

	def render
		p "#{@stacks}"
	end

	def won?
		(@stacks[2].size == 3 || @stacks[1].size == 3) && @stacks[0].empty?
	end

	def s_and_t
		gets.chomp.split(/\D+/).map!{|j| j.to_i}
	end

	def play
		until won?
			puts "Please enter moves, separated by a space or comma"
			render
			s_t = s_and_t
			move(s_t[0], s_t[1])
		end
		render
		p won? ? "You WON!!!!!!!!!!" : "Loser"
	end

end


# REV All looks good, but the each with index is a bit confusing, since you never
# actually use the element (el). I think a simple i-loop and j-loop would look nicer, or maybe
# just an each_index if you don't want to keep count. 
def stock_picker(array)
	buy = 0
	sell = 0
	array.each_with_index do |el, i|
		j = i + 1

		while j < array.size do
			if array[j] - array[i] > array[sell] - array[buy]
				buy, sell = i, j
			end
			j += 1
		end
	end
	sell > buy ? [buy, sell] : []
end











