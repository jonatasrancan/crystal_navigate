require "./exceptions/*"

module CrystalNavigate
  class Position
    def initialize(latitude : Float64, longitude : Float64)
      @latitude = latitude
      @longitude = longitude

      valid?
    end

    private def valid_latitude?
      raise LatitudeException.new unless (-90.0..90.0).includes?(@latitude)

      return true
    end

    private def valid_longitude?
      raise LongitudeException.new unless (-180.0..180.0).includes?(@longitude)

      return true
    end

    private def valid?
      valid_latitude? && valid_longitude?
    end
  end
end
