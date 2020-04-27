class Episode < ApplicationRecord
  belongs_to :season
  validates_presence_of :number_in_season
end
