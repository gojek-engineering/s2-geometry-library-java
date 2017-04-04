module S2Geometry
  def S2Cell.build_from_lat_long(latitude, longitude)
    self.new(
      com.google.common.geometry.S2CellId.from_lat_lng(
          com.google.common.geometry.S2LatLng.from_degrees(latitude, longitude)
      )
    )
  end
end
