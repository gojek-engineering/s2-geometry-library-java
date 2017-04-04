module S2Geometry #:nodoc:
  S2Cell.class_eval do
    # Convert latitude and longitude (floats or doubles) 
    # to a S2Cell insteance at leaf node level (30)
    def self.build_from_lat_long(latitude, longitude)
      self.new(
        com.google.common.geometry.S2CellId.from_lat_lng(
            com.google.common.geometry.S2LatLng.from_degrees(latitude, longitude)
        )
      )
    end
    
    # 64bit S2Id as a long
    def long_id
      self.id.id
    end
  end
end
