# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.question }
    body { Faker::Lorem.paragraph }
    user { create(:user) }
  end
end
