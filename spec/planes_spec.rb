require 'planes'

describe Plane do

	let(:plane) 	{ Plane.new }

	it 'has flying status when created' do
		expect(plane).to be_flying
	end

	it "has flying status when in the air" do
		plane.fly!
		expect(plane).to be_flying
	end

	it "can land" do
		plane.land!
		expect(plane).not_to be_flying
	end

	it "can take off" do
		plane.land!
		plane.fly!
		expect(plane).to be_flying
	end

end