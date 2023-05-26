# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    name     { Faker::TvShows::Friends.character }
    phone    { '+380674320395' }
    password { 'vlad1972' }
  end
end
