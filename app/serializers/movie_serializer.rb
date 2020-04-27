class MovieSerializer < ApplicationSerializer
  attributes :title, :plot

  cache_options enabled: true, store: Rails.cache, namespace: 'JsonResponse.MovieSerializer', expires_in: 1.hour
end
