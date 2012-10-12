class Round < ActiveRecord::Base
  attr_accessible :closing_date, :matches_attributes, :results_entered
  belongs_to :competition
  has_many :matches
  accepts_nested_attributes_for :matches

  validate :round_closing_date_cannot_be_today_or_in_the_past, on: :create

  def round_closing_date_cannot_be_today_or_in_the_past
    unless closing_date.nil? or closing_date.blank?
      if closing_date.today? or closing_date.past?
        errors.add(:closing_date, "can't be today or in the past")
      end
    else
      errors.add(:closing_date, "can't be blank")
    end
  end

  def open?
    Time.now < closing_date
  end

  def has_results?
    results_entered
  end
end
