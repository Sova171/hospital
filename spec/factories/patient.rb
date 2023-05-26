# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    name     { Faker::TvShows::Friends.character }
    phone    { '+380674320000' }
    password { 'vlad1972' }
  end
end
