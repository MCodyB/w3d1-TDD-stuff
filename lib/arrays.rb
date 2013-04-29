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

end

class TowersOfHanoi
	attr_accessor :stacks
	def initialize
		@stacks = [[3, 2, 1], [], []]
	end

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









