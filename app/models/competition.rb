class Competition < ActiveRecord::Base
  attr_accessible :name
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'

  has_many :participations
  has_many :participants, through: :participations, source: :user

  has_many :rounds
  accepts_nested_attributes_for :rounds, :reject_if => :all_blank, :allow_destroy => true

  validates :user_id, presence: true
  validates :name, presence: true

  after_create :participate_owner

  private
    def participate_owner
      participants << owner
    end
end
