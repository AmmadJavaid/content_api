class Movie < ApplicationRecord
  has_many :purchases, as: :purchase_of
end
