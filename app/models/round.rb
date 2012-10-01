class Round < ActiveRecord::Base
  attr_accessible :closing_time, :competition_id
  belongs_to :competition

  def open?
    Time.now < closing_time
  end
end
