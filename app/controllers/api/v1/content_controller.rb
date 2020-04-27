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
      end

      def purchase
      end

      def library
      end
    end
  end
end
