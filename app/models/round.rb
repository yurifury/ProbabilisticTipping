class Round < ActiveRecord::Base
  attr_accessible :closing_time
  belongs_to :competition

  def open?
    Time.now < closing_time
  end
end
