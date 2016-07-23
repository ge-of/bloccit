FactoryGirl.define do
  factory :comment do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    topic
    post
    user
  end
end
