require "./exceptions/bearing_exception"

module CrystalNavigate
  class Destination
    @latitude : Float64
    @longitude : Float64
    @bearing : Float64
    @distance : Float64
    @radius_unit : Float64

    def initialize(position : Position, bearing : Float64, distance : Float64, radius_unit = EarthRadius::KM)
      @latitude = position.latitude
      @longitude = position.longitude
      @bearing = bearing
      @distance = distance
      @radius_unit = radius_unit

      valid_bearing?
    end

    def calculate
      new_lat = Math.asin(
        Math.sin(@latitude) * Math.cos(@distance / @radius_unit) +
        Math.cos(@latitude) * Math.sin(@distance / @radius_unit) *
        Math.cos(@bearing)
      )

      new_lon = @longitude + Math.atan2(
        Math.sin(@bearing) * Math.sin(@distance / @radius_unit) * Math.cos(@latitude),
        Math.cos(@distance / @radius_unit) - Math.sin(@latitude) * Math.sin(new_lat)
      )

      new_lon = (new_lon + Math::PI) % (2 * Math::PI) - Math::PI

      Position.new(Conversions.to_degrees(new_lat), Conversions.to_degrees(new_lon))
    end

    private def valid_bearing?
      raise BearingException.new unless (0.0..360.0).includes?(@bearing)
    end
  end
end
