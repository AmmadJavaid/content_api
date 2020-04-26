class Purchase < ApplicationRecord
  belongs_to :purchase_of, polymorphic: true
end
