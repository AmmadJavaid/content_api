require 'rails_helper'

describe "get all movies", type: :request do
  let!(:movies) {FactoryBot.create_list(:movies, 10)}
  before {get '/api/v1/content/movies'}

  it 'returns all movies' do
    expect(JSON.parse(response.body)["data"].size).to eq(10)
  end

  it 'movie list in descending order' do
    expect(JSON.parse(response.body)["data"].first["id"].to_i).to eq(Movie.last.id)
  end
end
