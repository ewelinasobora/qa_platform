# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    avatar_url { Faker::Avatar.image }
    password do
      Faker::Internet.password(
        min_length: 10,
        max_length: 20,
        mix_case: true,
        special_characters: true
      )
    end
  end
end
