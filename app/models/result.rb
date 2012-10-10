class Result < ActiveRecord::Base
  attr_accessible :winner

  belongs_to :match
  has_one :round, through: :match
  has_one :competition, through: :match

  validates :winner, :inclusion => { :in => %w(1 draw 2),
    :message => "%{value} is not a valid winner!" }
end
