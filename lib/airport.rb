require_relative 'weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 6

	def hanger
		@hanger ||= []
	end

	def land_a(plane)
		raise "The weather is too stormy to land here you fool!" if weather_stormy?
		raise "We're full at the minute I'm afraid sonny jim" if full?
		plane.land!
		hanger << plane
	end

	def take_off
		raise "The weather is too stormy for take off just now son" if weather_stormy?
		hanger.pop
	end

	def full?
		if hanger.count >= DEFAULT_CAPACITY
			true
		else
			false
		end
	end

end