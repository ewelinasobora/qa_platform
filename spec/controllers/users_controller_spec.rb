# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #user_profile" do
    let(:user) { create(:user) }

    context "when user not logged in" do
      login_user
      it "returns http success" do
        get :user_profile, params: { id: user.id }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
