require 'rails_helper'

RSpec.describe Eventearthquake, type: :model do


  describe "validations" do
    it "validate fields" do
      should validate_presence_of(:type)
      should validate_presence_of(:external_id)
      should validate_presence_of(:magnitude)
      should validate_presence_of(:place)
      should validate_presence_of(:time)
      should validate_presence_of(:mag_type)
      should validate_presence_of(:title)
      should validate_presence_of(:longitude)
      should validate_presence_of(:latitude)
      should validate_presence_of(:url)
    end   
    
  end
end
