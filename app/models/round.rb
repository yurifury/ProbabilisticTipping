class Round < ActiveRecord::Base
  attr_accessible :closing_time, :matches_attributes
  belongs_to :competition
  has_many :matches
  accepts_nested_attributes_for :matches

  def open?
    Time.now < closing_time
  end
end
