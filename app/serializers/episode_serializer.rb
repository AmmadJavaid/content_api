class EpisodeSerializer < ApplicationSerializer
  attributes :title, :plot, :number_in_season

  cache_options enabled: true, store: Rails.cache, namespace: 'JsonResponse.EpisodeSerializer', expires_in: 1.hour
end
