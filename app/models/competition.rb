class Competition < ActiveRecord::Base
  attr_accessible :name, :competitor_set_id

  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'

  has_many :participations
  has_many :participants, through: :participations, source: :user

  has_many :rounds

  belongs_to :competitor_set
  has_many :competitors, through: :competitor_set

  validates :user_id, presence: true
  validates :name, presence: true
  validates :competitor_set, presence: true

  after_create :participate_owner

  private
    def participate_owner
      participants << owner
    end
end
