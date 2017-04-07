module CrystalNavigate
  class Bearing
    @latitude1 : Float64
    @latitude2 : Float64
    @longitude1 : Float64
    @longitude2 : Float64

    def initialize(position1 : Position, position2 : Position)
      @latitude1 = Conversions.to_radians(position1.latitude)
      @longitude1 = Conversions.to_radians(position1.longitude)
      @latitude2 = Conversions.to_radians(position2.latitude)
      @longitude2 = Conversions.to_radians(position2.longitude)
    end

    def calculate
      dLon = @longitude2 - @longitude1

      y = Math.sin(dLon) * Math.cos(@latitude2)
      x = Math.cos(@latitude1) * Math.sin(@latitude2) -
          Math.sin(@latitude1) * Math.cos(@latitude2) * Math.cos(dLon)

      Conversions.to_bearing(Math.atan2(y, x))
    end
  end
end
