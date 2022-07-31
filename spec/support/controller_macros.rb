# frozen_string_literal: true

module ControllerMacros
  def login_user
    before do
      sign_in FactoryBot.create(:user, email: "tony@stark.com")
    end
  end
end
