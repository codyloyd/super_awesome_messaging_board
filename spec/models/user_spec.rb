require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "generates full name correctly" do
    user = build(:user, first_name:'HireMe', last_name:'Pls')
    expect(user.full_name).to eql("HireMe Pls")
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:posts) }
  it { should have_many(:comments) }
end
