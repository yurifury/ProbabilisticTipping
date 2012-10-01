class Round < ActiveRecord::Base
  attr_accessible :closing_time
  belongs_to :competition
  has_many :matches

  def open?
    Time.now < closing_time
  end
end
