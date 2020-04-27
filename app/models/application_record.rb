class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ordered
    order("created_at DESC")
  end
end
