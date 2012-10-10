class CompetitorSet < ActiveRecord::Base
  attr_accessible :name, :competitors_attributes

  belongs_to :owner, class_name: 'User'
  has_many :competitors, dependent: :destroy
  has_many :competitions
  accepts_nested_attributes_for :competitors

  validates :name, presence: true
end
