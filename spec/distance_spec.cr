require "./spec_helper"

describe CrystalNavigate::Distance do
  describe "calculate" do
    context "with default radius unit" do
      it "calculates the distance between two positions" do
        position1 = CrystalNavigate::Position.new(45.66, 150.66)
        position2 = CrystalNavigate::Position.new(45.66, 100.66)

        distance = CrystalNavigate::Distance.new(position1, position2).calculate

        distance.should eq 3820.6572784936852
      end
    end

    context "with NM as radius unit" do
      it "calculates the distance between two positions" do
        position1 = CrystalNavigate::Position.new(45.66, 150.66)
        position2 = CrystalNavigate::Position.new(45.66, 100.66)

        distance = CrystalNavigate::Distance.new(position1, position2, EarthRadius::NM).calculate

        distance.should eq 2062.9900984330384
      end
    end
  end
end
