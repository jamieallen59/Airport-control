require 'airport'
require 'weather'

describe Airport do

	let(:airport) 			{ Airport.new	 }
	let(:plane)   			{ Plane.new		 }

	before(:each) do
		allow(airport).to receive(:weather_stormy?).and_return(false)
	end

	def the_weather_is_stormy
		allow(airport).to receive(:weather_stormy?).and_return(true)
	end

	it "should be able to contain (have a default capacity) of 6 planes" do
		expect(airport).not_to be_full
		(Airport::DEFAULT_CAPACITY).times{ airport.land_a(plane) }
		expect(airport).to be_full
	end

	context "taking off and landing" do
		it "a plane can land" do
			airport.land_a(plane)
			expect(airport.hanger).to eq [plane]
		end

		it "a plane can take off (assuming the weather is sunny!)" do
			plane1 = Plane.new
			plane2 = Plane.new
			airport.land_a(plane1)
			airport.land_a(plane2)
			airport.take_off(plane2)
			expect(airport.hanger).to eq [plane1]
		end
	end

	context "traffic  control" do
		it "a plane cannot land if the airport is full" do
			expect(airport).not_to be_full
			(Airport::DEFAULT_CAPACITY).times{ airport.land_a(plane) }
			expect(airport).to be_full
			expect{ airport.land_a(plane) }.to raise_error(RuntimeError)
		end
	end

		context "weather conditions:" do
			it "a plane cannot take off when there is a storm brewing" do
				the_weather_is_stormy
				expect{ airport.take_off(plane) }.to raise_error(RuntimeError)
			end

			it "a plane cannot land in the middle of a storm" do
				the_weather_is_stormy
				expect{ airport.land_a(plane) }.to raise_error(RuntimeError)
			end
		end

		# checking which airport the plane has come from

		it 'all planes can land and all planes can take off' do
			allow(airport).to receive(:weather_stormy?)
  			(Airport::DEFAULT_CAPACITY).times{ airport.land_a(plane) }
  			while plane.flying? == true
  				airport.land_a(plane)
  			end
  			expect(airport).to be_full
  			(Airport::DEFAULT_CAPACITY).times{ airport.take_off(plane) }
  			while plane.flying? == false
  				airport.take_off(plane)
  			end
  			expect(airport).not_to be_full

  		end
	
end	



