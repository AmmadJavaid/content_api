class Season < ApplicationRecord
  has_many :episodes
  has_many :purchases, as: :purchase_of
end
