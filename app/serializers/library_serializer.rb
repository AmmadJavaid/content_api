class LibrarySerializer < ApplicationSerializer
  set_type :purchase

  attribute :expire_at do |record|
    record.expire_at.in_time_zone.strftime('%-d %b %Y %-I:%M %p')
  end

  belongs_to :purchase_of, polymorphic: true
end
