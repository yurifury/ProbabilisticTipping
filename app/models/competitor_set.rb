class CompetitorSet < ActiveRecord::Base
  attr_accessible :name

  belongs_to :owner, class_name: 'User'
  has_many :competitors
  has_many :competitions
end
