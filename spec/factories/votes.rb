include RandomData

FactoryGirl.define do
  factory :vote do
    value RandomData.random_value
    user
    post
  end
end
