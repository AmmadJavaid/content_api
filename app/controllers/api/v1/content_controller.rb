module Api
  module V1
    class ContentController < BaseController
      def index
      end

      def movies
        movies = Movie.ordered
        json_response MovieSerializer.new(movies).serializable_hash
      end

      def seasons
        seasons = Season.includes(:episodes).ordered.first
        options = {include: [:episodes], params: { episodes: true }}

        json_response SeasonSerializer.new(seasons, options).serializable_hash
      end

      def purchase
      end

      def library
      end
    end
  end
end
