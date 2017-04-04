require 'spec_helper'

describe S2Geometry::S2Cell do
  context 'factory' do
    it 'can build from latitude, longitude' do
      expect(described_class.build_from_lat_long(1, 1)).to be_an_instance_of(described_class)
    end
  end
end

