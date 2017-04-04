require "spec_helper"

describe S2Geometry::S2Cell do
  let(:latitude) { -6.2 }
  let(:longitude) { 106.816667 }
  let(:s2_long_id) { 3344475367704269805 }
  
  context "factory" do
    context "lat/lng" do
      let(:s2cell) { described_class.build_from_lat_long(latitude, longitude) }
      
      it "can build instance from latitude, longitude" do
        expect(s2cell).to be_an_instance_of(described_class)
      end
        
      it "builds from latitude, longitude at leaf level" do
        expect(s2cell.is_leaf).to eq(true)
      end
      
      it "can return its S2 id as a long id" do
        expect(s2cell.long_id).to eq(s2_long_id)
      end
    end
    
    context "long id" do
      let(:s2cell) { described_class.build_from_long_id(s2_long_id) }
      
      it "can build from long S2 id" do
        expect(s2cell).to be_an_instance_of(described_class)
      end
      
      it "resulting instance has same long S2 id" do
        expect(s2cell.long_id).to eq(s2_long_id)
      end
    end
    
    context "hierarchy" do
      let(:s2cell) { described_class.build_from_long_id(s2_long_id) }
      
      it "knows its level" do
        expect(s2cell.level).to eq(30)
      end
      
      it "has a S2Cell for a parent" do
        expect(s2cell.parent).to be_an_instance_of(described_class)
      end
      
      it "immediate parent is level 29" do
        expect(s2cell.parent.level).to eq(29)
      end

      it "arbitrary level parent is findable" do
        expect(s2cell.parent(15).level).to eq(15)
      end      
      
      it "arbitrary level parent is a S2Cell" do
        expect(s2cell.parent(15)).to be_an_instance_of(described_class)
      end      
    end
  end  
end

