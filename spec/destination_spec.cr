require "./spec_helper"

describe CrystalNavigate::Destination do
  context "validation" do
    context "with invalid bearing" do
      it "raises BearingException" do
        position = CrystalNavigate::Position.new(45.66, 150.66)
        bearing = 400.00
        distance = 20.00

        expect_raises(BearingException) do
          CrystalNavigate::Destination.new(position, bearing, distance)
        end
      end
    end
  end

  describe "calculate" do
    it "returns a Position Instance" do
      position = CrystalNavigate::Position.new(45.66, 150.66)
      bearing = 200.00
      distance = 20.00

      destination = CrystalNavigate::Destination.new(position, bearing, distance).calculate

      destination.should be_a(CrystalNavigate::Position)
    end

    context "with default radius unit" do
      it "returns a Position instace with the correct values for latitude and longitude based on KM" do
        position = CrystalNavigate::Position.new(45.66, 150.66)
        bearing = 200.00
        distance = 20.00

        destination = CrystalNavigate::Destination.new(position, bearing, distance).calculate

        destination.latitude.should eq 83.785102181745714
        destination.longitude.should eq -6.3667735547994697
      end
    end

    context "with NM as radius unit" do
      it "returns a Position instace with the correct values for latitude and longitude based on NM" do
        position = CrystalNavigate::Position.new(45.66, 150.66)
        bearing = 200.00
        distance = 20.00

        destination = CrystalNavigate::Destination.new(position, bearing, distance, EarthRadius::NM).calculate

        destination.latitude.should eq 83.705720963007295
        destination.longitude.should eq -5.1635531200884452
      end
    end
  end
end
