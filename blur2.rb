class Image
	attr_reader :image

	def initialize(image)
		@image = image
	end
	
	def output_image
		@image.each do |line|
			p line
		end

	end

	def find_ones
		results = []
		@image.each_with_index do |row, y|
			row.each_with_index do |number, x|
				if number == 1
					results.push [y,x]
				end
			end
		end
		return results
	end
	
end
image = Image.new([
	[0, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 1],
	[0, 0, 0, 0]
])

p image.find_ones