FactoryGirl.define do

  factory :user do
    email "user@example.com"
    password "foobar11"
    password_confirmation "foobar11"
  end

  factory :category do
    name "category"
  end
end