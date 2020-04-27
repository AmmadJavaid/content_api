class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ordered
    order("created_at DESC")
  end

  def cache_key
    "movie-#{self.id}-#{self.updated_at.to_i}"
  end
end
