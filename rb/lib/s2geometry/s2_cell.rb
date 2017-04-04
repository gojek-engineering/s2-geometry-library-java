module S2Geometry #:nodoc:
  S2Cell.class_eval do
    # Build a S2Cell instance at leaf node level (30)
    # from a decimal latitude and longitude pair
    def self.build_from_lat_long(latitude, longitude)
      self.new(
        com.google.common.geometry.S2CellId.from_lat_lng(
            com.google.common.geometry.S2LatLng.from_degrees(latitude, longitude)
        )
      )
    end
    
    # Build a S2Cell instance from a 64 bit long
    def self.build_from_long_id(long_id)
      self.new(com.google.common.geometry.S2CellId.new(long_id))
    end
    
    # 64bit S2Id as a long
    def long_id
      self.id.id
    end
  end
end
