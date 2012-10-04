class Match < ActiveRecord::Base
  attr_accessible :competitor_1, :competitor_2
  belongs_to :competitor_1, class_name: 'Competitor'
  belongs_to :competitor_2, class_name: 'Competitor'
  belongs_to :round
  has_one :competition, through: :round

  validate :competitors_cant_play_themselves

  def competitors_cant_play_themselves
    if competitor_1 == competitor_2
      errors.add(:competitor_1, "A Competitor can't play themselves!")
    end
  end
end
