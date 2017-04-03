module S2Geometry
  class S2Cell
    import 'com.google.common.geometry'

    S2_LEVEL_4_X_4_METRES = 21

    attr_reader :s2id

    def initialize(s2_id)
      @s2id = s2_id
    end

    def self.build_from_lat_long(latitude, longitude)
      new(S2CellId.from_lat_lng(S2LatLng.from_degrees(latitude, longitude)).parent(S2_LEVEL_4_X_4_METRES))
    end

    def self.convert_to_lat_long(numeric_s2id)
      S2CellId.new(numeric_s2id).to_lat_lng
    end
  end
end
