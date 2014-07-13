class Plane

	def initialize
		@flying =  true
	end

	def flying?
		@flying
	end

	def fly!
		@flying = true
	end

	def land!
		@flying = false
	end

	#add ability to land at the actual airport
	#add ability to take off from the actual airport


end