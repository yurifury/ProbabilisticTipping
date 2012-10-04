class Competitor < ActiveRecord::Base
  attr_accessible :name

  belongs_to :competitor_set
  has_many :matches
  
  validates :name, presence: true
end
