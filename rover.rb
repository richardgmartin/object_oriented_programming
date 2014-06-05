# mars rover exercise

# boundary check class definition and logic

class Boundary
	attr_reader :x_limit, :y_limit

	def initialize(x_limit, y_limit)
		@x_limit = x_limit
		@y_limit = y_limit
	end
	
	def boundary_check(x_check, y_check)
		if x_check > @x_limit
			puts "Rover fell off the East West grid"
		elsif y_check > @y_limit
			puts "Rover fell off the North South grid"	
		else
			puts "Rover has stayed within the grid"	
		end	
	end	

end	

# rover class definition and logic
class Rover
	attr_accessor :x, :y, :o

	def initialize(x, y, o)
		@x = x
		@y = y
		@o = o
	end

	# read string and determine action - move or rotate
	def read_direction(direction)
		# string to array conversion
		array_direction = direction.split("")
		# p array_direction

		array_direction.each do |dir| 
			if dir == "L" || dir == "R"
				rotate(dir)
				# p @o
			else 
				move
			end	
		end	
	end		

	# rotate rover and change orientation based on dir
	def rotate(dir)
		bearings = ["N", "E", "S", "W"]
		current_index = bearings.index(@o)
		if dir == "L"
			current_index -= 1
		else
			current_index += 1
		end
		@o = bearings[current_index % 4]
	end


	# move rover on x or y axis position and orientation
	def move
		if @o == "N"
			@y += 1
		elsif @o == "S"
			@y -= 1
		elsif @o == "E"
			@x += 1
		else @x -= 1
		end	 				
	end
end	

# instantiate and process rover1

rover1 = Rover.new(1, 2, "N")

puts "Rover 1 starting position is #{rover1.x}, #{rover1.y}, #{rover1.o}"

rover1.read_direction("LMLMLMLMM")

puts "Rover 1 end position is #{rover1.x}, #{rover1.y}, #{rover1.o}"

rover1_boundary = Boundary.new(2, 2)

puts "Rover 1 boundary is #{rover1_boundary.x_limit}, #{rover1_boundary.y_limit}"

rover1_boundary.boundary_check(rover1.x, rover1.y)


# instantiate and process rover2

rover2 = Rover.new(3, 3, "E")

puts "Rover 2 starting position is #{rover2.x}, #{rover2.y}, #{rover2.o}"

rover2.read_direction("MMRMMRMRRM")

puts "Rover 2 end position is #{rover2.x}, #{rover2.y}, #{rover2.o}"

