require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
    @post = create(:post)
  end

  describe '#create' do 
    it "redirects to the post upon save" do
      post :create, comment: {comment: attributes_for(:comment)}, post_id: @post.id
      expect(response).to redirect_to @post
    end
    it "redirects to the post upon invalid save" do
      post :create, comment: {comment: attributes_for(:invalid_comment)}, post_id: @post.id
      expect(response).to redirect_to @post
    end

  end
end
