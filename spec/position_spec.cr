require "./spec_helper"

describe CrystalNavigate::Position do
  context "with invalid latitude" do
    it "raises LatitudeException" do
      expect_raises(LatitudeException) do
        CrystalNavigate::Position.new(-200.0, 180.0)
      end
    end
  end

  context "with invalid longitude" do
    it "raises LongitudeException" do
      expect_raises(LongitudeException) do
        CrystalNavigate::Position.new(90.0, 500.0)
      end
    end
  end

  context "valid" do
    it "instantiate a Position" do
      CrystalNavigate::Position.new(90.0, 180.0).should be_a(CrystalNavigate::Position)
    end
  end
end
