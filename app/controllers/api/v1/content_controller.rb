module Api
  module V1
    class ContentController < BaseController
      def index
        json_response ContentSerializer.new(FetchContentService.execute).serializable_hash
      end

      def movies
        movies = Movie.ordered
        json_response MovieSerializer.new(movies).serializable_hash
      end

      def seasons
        seasons = Season.includes(:episodes).ordered
        options = {include: [:episodes], params: { episodes: true }}

        json_response SeasonSerializer.new(seasons, options).serializable_hash
      end

      def purchase
        purchase = Purchase.new(purchase_params)
        purchase.purchase_of_type = purchase.purchase_of_type.classify

        if purchase.save
          json_response PurchaseSerializer.new(purchase).serializable_hash
        else
          unsuccessful_response(purchase.errors.full_messages.to_sentence)
        end
      end

      def library
        purchases = FetchLibraryService.new(params[:user_id]).execute
        json_response PurchaseSerializer.new(purchases).serializable_hash
      end

      private

      def purchase_params
        params.permit(:user_id, :purchase_of_type, :purchase_of_id, :price, :content_quality)
      end
    end
  end
end
