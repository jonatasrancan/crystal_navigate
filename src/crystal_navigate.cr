require "./crystal_navigate/*"

module EarthRadius
  KM =     6_371.009
  MI =     3_958.761
  NM =     3_440.070
  YD =  6_967_420.00
  FT = 20_902_260.00
end

def position(latitude : Float64, longitude : Float64)
  CrystalNavigate::Position.new(latitude, longitude)
end

def distance(position1 : CrystalNavigate::Position, position2 : CrystalNavigate::Position, radius_unit = EarthRadius::KM)
  CrystalNavigate::Distance.new(position1, position2, radius_unit).calculate
end

def destination(position : CrystalNavigate::Position, bearing : Float64, distance : Float64, radius_unit = EarthRadius::KM)
  CrystalNavigate::Destination.new(position, bearing, distance, radius_unit).calculate
end

def bearing(position1 : CrystalNavigate::Position, position2 : CrystalNavigate::Position)
  CrystalNavigate::Bearing.new(position1, position2).calculate
end
