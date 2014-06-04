# 4 create a parent Person class

class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end


# 1 create two classes
# 2 create learn method in class Student
# 3 create teach method in class Instructor

class Student < Person
	def learn
		puts "I get it"
	end	
end

class Instructor < Person
	def teach
		puts "Everything is Ruby is an Object"
	end	
end		

# 5 create a method to allow the student and instructor to greet

def greeting(person_name)
	puts "Hi, my name is #{person_name}"
end

# 6 name and create greeting for instructor Chris

chris = Instructor.new("Chris")

greeting(chris.name)

# 7 name and create greeting for student Christina

cristina = Student.new("Cristina")

greeting(cristina.name)

# 8 call teach method on instructor

chris.teach

# 8 call learn method on your student

cristina.learn

# 8 call teach method on student instance

cristina.teach

# method call fails because teach method is not defined for Student class only Instructor class

