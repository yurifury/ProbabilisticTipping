class Competitor < ActiveRecord::Base
  attr_accessible :name
  belongs_to :competition
  has_many :matches
  validates :name, presence: true
end
