FactoryGirl.define do

  factory :user do
    email "user@example.com"
    password "foobar11"
    password_confirmation "foobar11"
  end

  factory :category do
    name "category"
    description "I'm the best category in the world"
  end

  factory :product do
    name "category"
    description "I'm the best category in the world"
    features "Features of best category in the world"
    association :category
  end

  factory :article do
    title "article title"
    content "article content"
  end
end