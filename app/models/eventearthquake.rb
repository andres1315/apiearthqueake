class Eventearthquake < ApplicationRecord
  self.inheritance_column = :custom_type
  
  validates :type ,presence:true
  validates :external_id ,presence:true
  validates :place ,presence:true
  validates :time ,presence:true
  validates :tsunami , inclusion: {in: [true,false]}
  validates :mag_type ,presence:true
  validates :title ,presence:true
  #validates :magnitude ,presence:true
  #validates :longitude ,presence:true
  #validates :latitude ,presence:true
  validates :magnitude, presence:true, numericality: { greater_than_or_equal_to: -1.0, less_than_or_equal_to: 10.0 }
  validates :latitude, presence:true, numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
  validates :longitude, presence:true, numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
  validates :url ,presence:true

end
