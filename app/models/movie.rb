class Movie < ApplicationRecord
  has_many :purchases, as: :purchase_of
  scope :ordered, -> { order("created_at DESC") }
end
