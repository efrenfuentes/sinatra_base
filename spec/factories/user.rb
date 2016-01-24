require 'faker'

FactoryGirl.define do
  factory :user do
    email                   { Faker::Internet.email }
    password                "eD04gV07amGyEF"
    password_confirmation   "eD04gV07amGyEF"
  end

  factory :user_no_password, class: User do
    email                   { Faker::Internet.email }
  end
end
