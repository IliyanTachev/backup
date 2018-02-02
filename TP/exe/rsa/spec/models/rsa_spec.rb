RSpec.describe RSA do
	it "encrypts" do
		r = RSA.new
		expect(r.encrypt("blabla")).to eq "qwert"
	end
end
