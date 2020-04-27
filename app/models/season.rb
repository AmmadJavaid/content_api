class Season < ApplicationRecord
  has_many :episodes, -> { order(:number_in_season) }
  has_many :purchases, as: :purchase_of
end
