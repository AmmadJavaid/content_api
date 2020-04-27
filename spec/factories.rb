FactoryBot.define do
  factory :movies, class: 'Movie' do
    title { Faker::Movie.quote}
  end

  factory :episode, class: 'Episode' do
    title { Faker::Movie.quote}
    number_in_season { Faker::Number.between(1, 10) }
    season
  end

  factory :season, class: 'Season' do
    title { Faker::Movie.quote}
    number { Faker::Number.between(1, 10) }

    factory :season_with_episodes do
      transient do
        episodes_count { 5 }
      end

      after(:create) do |season, evaluator|
        create_list(:episode, evaluator.episodes_count, season: season)
      end
    end
  end
end
