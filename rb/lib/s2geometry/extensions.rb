require 's2geometry/extensions/s2_cell'

module S2Geometry
  import 'com.google.common.geometry'
  S2Cell.send(:include, Extensions::S2Cell::InstanceMethods)
  S2Cell.extend Extensions::S2Cell::ClassMethods
end

