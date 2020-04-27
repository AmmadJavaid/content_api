class ContentSerializer
  include FastJsonapi::ObjectSerializer

  attribute :title do |record|
    record["title"]
  end

  attribute :plot do |record|
    record["plot"]
  end

  attribute :content_type do |record|
    record["type"]
  end

  attribute :content_id do |record|
    record["id"]
  end

  attribute :created_at do |record|
    Time.find_zone('UTC').parse(record["created_at"]).in_time_zone.strftime('%-d %b %Y %-I:%M %p')
  end

  set_id {|record| record["id"]}
end
