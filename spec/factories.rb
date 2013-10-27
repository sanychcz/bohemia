FactoryGirl.define do

  factory :user do
    email "user@example.com"
    password "foobar11"
    password_confirmation "foobar11"
  end

  factory :category do
    name "category"
    description "I'm the best category in the world"
    annotation "Best category annotation"
  end

  factory :product do
    name "product"
    description "I'm the best product in the world"
    features "Features of best product in the world"
    annotation "Product annotation"
    association :category

    factory :product2 do
      name "product 2"
      description "I'm the best category in the world"
      features "Features of best category in the world"
      annotation "Product annotation"
    end

    factory :product3 do
      name "product 3"
      description "I'm the best product in the world"
      features "Features of best product in the world"
      annotation "Product annotation"
    end

  end

  factory :article do
    title "article title"
    content "article content"
    annotation "article annotation"

    factory :article2 do
      title "article title"
      content "article content"
      annotation "second article annotation"
    end

    factory :article3 do
      title "article title"
      content "article content"
      annotation "third article annotation"
    end
  end
end