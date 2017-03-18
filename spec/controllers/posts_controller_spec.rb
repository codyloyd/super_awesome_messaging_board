require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
  end

  describe '#create' do 
    it "redirects to the posts upon save" do
      post :create, post: attributes_for(:post)
      expect(response).to redirect_to posts_url
    end
    it "redirects to the posts upon error" do
      post :create, post: attributes_for(:invalid_post)
      expect(response).to render_template :new
    end
  end
end
