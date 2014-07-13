module Weather

	def weather_stormy?
		array = ['stormy', 'sunny', 'sunny']
		mixup = array.sample
			if mixup == 'stormy'
				true
			else 
				false
			end
		end

end