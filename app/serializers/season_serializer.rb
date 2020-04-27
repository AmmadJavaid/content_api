class SeasonSerializer < ApplicationSerializer
  attributes :title, :number, :plot
  has_many :episodes, if: Proc.new { |record, params| params && params[:episodes] }

  cache_options store: Rails.cache, namespace: 'JsonResponse.MovieSerializer', expires_in: 1.hour
end
