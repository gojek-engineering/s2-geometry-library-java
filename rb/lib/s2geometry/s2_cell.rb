module S2Geometry #:nodoc:
  # Convert latitude and longitude (floats or doubles) 
  # to a S2Cell insteance at leaf node level (30)
  def S2Cell.build_from_lat_long(latitude, longitude)
    self.new(
      com.google.common.geometry.S2CellId.from_lat_lng(
          com.google.common.geometry.S2LatLng.from_degrees(latitude, longitude)
      )
    )
  end
end
