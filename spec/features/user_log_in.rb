require 'rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    @user = create(:user)
  end

  it "logs in successfully" do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(current_path).to eq root_path
    expect(page).to have_content 'New Post'
  end
end