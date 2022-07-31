# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { is_expected.to have_rich_text(:body) }
end
