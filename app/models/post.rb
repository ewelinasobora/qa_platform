# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 70 }
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
