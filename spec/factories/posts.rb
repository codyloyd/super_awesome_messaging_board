FactoryGirl.define do
  factory :post do
    title "MyString"
    body "MyText"
    user_id 1
  end
  factory :invalid_post, parent: :post do
    title nil
  end
end
