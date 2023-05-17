FactoryBot.define do
  factory :appointment do
    request { "MyString" }
    recommendation { "MyText" }
    doctor { nil }
    patient { nil }
  end
end
