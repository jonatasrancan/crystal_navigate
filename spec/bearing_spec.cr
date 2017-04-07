require "./spec_helper"

describe CrystalNavigate::Bearing do
  describe "calculate" do
    it "calculates the Bearing between two positions" do
      position1 = CrystalNavigate::Position.new(45.66, 150.66)
      position2 = CrystalNavigate::Position.new(45.66, 100.66)

      bearing = CrystalNavigate::Bearing.new(position1, position2).calculate

      bearing.should eq 288.44382924748345
    end
  end
end
