class Image
	attr_reader :image

	def initialize(image)
		@image = image
		@results = []
	end
	
	def output_image
		@image.each do |line|
			p line
		end

	end

	def find_ones
		
		@image.each_with_index do |row, y|
			row.each_with_index do |number, x|
				if number == 1
					@results.push [y,x]
				end
			end
		end
	end


	def blur

		@results.each do |y_coordinate, x_coordinate| 
			
			#(y-1,x) == top
			if y_coordinate - 1 >= 0
				@image[y_coordinate - 1][x_coordinate] = 1
			end

			#(y+1,x) == bottom
			if y_coordinate + 1 <= @image.length - 1 
				@image[y_coordinate + 1][x_coordinate] = 1
			end

			#(y,x-1) == left
			if x_coordinate - 1 >= 0
				@image[y_coordinate][x_coordinate-1] = 1
			end

			#(y,x+1) == right
			if x_coordinate + 1 <= @image[0].length - 1
				@image[y_coordinate][x_coordinate + 1] = 1
			end
		end
	end
end


image = Image.new([
	[0, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 1],
	[0, 0, 0, 0]
])

image.find_ones
image.blur
image.output_image





