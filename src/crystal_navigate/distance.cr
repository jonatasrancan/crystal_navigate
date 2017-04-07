module CrystalNavigate
  class Distance
    @latitude1 : Float64
    @longitude1 : Float64
    @latitude2 : Float64
    @longitude2 : Float64
    @radius_unit : Float64

    def initialize(position1 : Position, position2 : Position, radius_unit = "KM")
      @latitude1 = Conversions.to_radians(position1.latitude)
      @longitude1 = Conversions.to_radians(position1.longitude)
      @latitude2 = Conversions.to_radians(position2.latitude)
      @longitude2 = Conversions.to_radians(position2.longitude)
      @radius_unit = EARTH_RADIUS[radius_unit]
    end

    def calculate
      Math.acos(
        Math.sin(@latitude1) * Math.sin(@latitude2) +
        Math.cos(@latitude1) * Math.cos(@latitude2) *
        Math.cos(@longitude2 - @longitude1)
      ) * @radius_unit
    end
  end
end
