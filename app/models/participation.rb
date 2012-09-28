class Participation < ActiveRecord::Base
  attr_accessible :competition_id
  belongs_to :user
  belongs_to :competition
end
