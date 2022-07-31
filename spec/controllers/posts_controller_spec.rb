# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    let(:posts) { create_list(:post, 5) }

    context "when user not logged in" do
      it "returns http success" do
        get :index

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #show" do
    let(:post) { create(:post) }

    context "when user not logged in" do
      it "doesn't return a success response" do
        get :show, params: { id: post.id }

        expect(response).to_not be_successful
      end
    end

    context "when user logged in" do
      login_user

      it "returns a success response" do
        get :show, params: { id: post.id }

        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    let(:new_post) { build(:post) }

    context "when user not logged in" do
      it "doesn't returns a success response" do
        post :create, params: { post: { title: new_post.title, body: new_post.body } }

        expect(response).to_not be_successful
      end
    end

    context "when user logged in" do
      login_user

      it "returns a success response" do
        post :create, params: { post: { title: new_post.title, body: new_post.body } }

        expect { Post.to change(Post, :count).by(1) }
      end
    end
  end

  describe "PUT #update" do
    let(:post) { create(:post) }

    context "when user not logged in" do
      let(:body) { Faker::Lorem.paragraph }

      it "doesn't return a success response" do
        put :update, params: { id: post.id, post: { body: body } }

        expect(response).to_not be_successful
        expect(post.reload.body).to eq post.body
      end
    end

    context "when user logged in" do
      login_user
      let(:body) { Faker::Lorem.paragraph }

      it "returns a success response" do
        put :update, params: { id: post.id, post: { body: body } }

        expect(response).to redirect_to(post)
        expect(post.reload.body).to eql body
      end
    end
  end

  describe "DELETE #destroy" do
    let(:post) { create(:post) }

    context "when user not logged in" do
      it "doesn't return a success response" do
        delete :destroy, params: { id: post.id }

        expect(response).to_not be_successful
        expect { Post.to change(Post, :count).by(0) }
      end
    end

    context "when user logged in" do
      login_user

      it "returns a success response" do
        delete :destroy, params: { id: post.id }

        expect { Post.to change(Post, :count).by(-1) }
      end
    end
  end
end
