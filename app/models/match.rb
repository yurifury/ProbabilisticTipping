class Match < ActiveRecord::Base
  attr_accessible :player1, :player2
  belongs_to :round
  has_one :competition, through: :round
end
