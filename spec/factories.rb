FactoryBot.define do
  factory :movies, class: 'Movie' do
    title { Faker::Movie.quote}
  end
end
