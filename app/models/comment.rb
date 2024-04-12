class Comment < ApplicationRecord
  belongs_to :eventearthquake
  
  validates :body, presence: true
end
