require "spec_helper"

describe S2Geometry::S2Cell do
  let(:latitude) { -6.2 }
  let(:longitude) { 106.816667 }
  let(:s2cell) { described_class.build_from_lat_long(latitude, longitude) }
  
  context "factory" do
    it "can build from latitude, longitude" do
      expect(s2cell).to be_an_instance_of(described_class)
    end
    
    it "builds from latitude, longitude at leaf level" do
      expect(s2cell.is_leaf).to eq(true)
    end
  end
  
  it "can return it's S2 id as a long" do
    expect(s2cell.long_id).to eq(3344475367704269805)
  end
end

