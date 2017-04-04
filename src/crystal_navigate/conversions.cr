module CrystalNavigate
  class Conversions
    # degrees to radians
    def self.to_radians(degrees : Float64)
      degrees * Math::PI / 180.0
    end

    # radians to bearing
    def self.to_bearing(radians : Float64)
      (to_degrees(radians) + 360.0) % 360.0
    end

    # radians to degree
    def self.to_degrees(radians : Float64)
      radians * 180 / Math::PI
    end
  end
end
