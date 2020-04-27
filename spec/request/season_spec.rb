require 'rails_helper'

describe "get all season by episode", type: :request do
  let!(:season_with_episodes) {FactoryBot.create_list(:season_with_episodes, 5)}
  before {get '/api/v1/content/seasons'}

  it 'returns all seasons' do
    expect(JSON.parse(response.body)["data"].size).to eq(5)
  end

  it 'seasons list in descending order' do
    expect(JSON.parse(response.body)["data"].first["id"].to_i).to eq(Season.last.id)
  end

  it 'episode order' do
    first_episode_id = Season.last.episodes.order(:number_in_season).first.id
    expect(JSON.parse(response.body)["data"].first["relationships"]["episodes"]["data"].first["id"].to_i).to eq(first_episode_id)
  end
end
