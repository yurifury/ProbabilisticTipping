class Competition < ActiveRecord::Base
  attr_accessible :name
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'

  has_many :participations
  has_many :participants, through: :participations, source: :user

  validates :user_id, presence: true
  validates :name, presence: true
end
