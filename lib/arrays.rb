class Array

	def my_uniq
		unique = []
		self.each do |el|
			unique << el unless unique.include?(el)
		end
		unique
	end

end