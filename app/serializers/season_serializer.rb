class SeasonSerializer < ApplicationSerializer
  attributes :title, :number, :plot
  has_many :episodes, if: Proc.new { |record, params| params && params[:episodes] }
end
