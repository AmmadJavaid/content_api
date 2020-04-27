class ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  attribute :created_at do |obj|
    obj.created_at.in_time_zone.strftime('%-d %b %Y %-I:%M %p')
  end
end
