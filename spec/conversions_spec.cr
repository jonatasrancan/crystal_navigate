require "./spec_helper"

describe CrystalNavigate::Conversions do
  describe "to_radians" do
    it "converts degrees to radians" do
      CrystalNavigate::Conversions.to_radians(50.0).should eq 0.87266462599716477
    end
  end

  describe "to_bearing" do
    it "converts radians to bearing" do
      CrystalNavigate::Conversions.to_bearing(195.05).should eq 15.541794026707066
    end
  end

  describe "to_degrees" do
    it "converts radinas to degrees" do
      CrystalNavigate::Conversions.to_degrees(0.87266462599716477).should eq 50.0
    end
  end
end
