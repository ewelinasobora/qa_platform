# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    post { create(:post) }
    user { post.user }
    body { "<p>#{Faker::Lorem.paragraph}</p>" }
  end
end
