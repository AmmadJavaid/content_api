class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :plot
end
