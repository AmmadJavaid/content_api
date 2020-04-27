require 'rails_helper'

describe "Purchase", type: :request do
  let!(:user) {FactoryBot.create(:user)}
  let!(:season) {FactoryBot.create(:season)}
  params = {user_id: 1, purchase_of_type: "Season", purchase_of_id: 1, content_quality: 'HD', price: 2.99}

  before do
    post '/api/v1/content/purchase', params: params
  end

  it 'purchased season' do
    expect(JSON.parse(response.body)['data']['id'].to_i).to eq(1)
  end


  it 'already purchased season' do
    post '/api/v1/content/purchase', params: params
    expect(JSON.parse(response.body)['data']['success']).to eq(false)
  end

  it 'already purchased message' do
    post '/api/v1/content/purchase', params: params
    expect(JSON.parse(response.body)['data']['message']).to eq('Item is already purchased')
  end
end
