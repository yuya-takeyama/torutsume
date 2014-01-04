# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text do
    subject "Test Subject"
    body "Test Body"

    association :user, factory: :users
  end
end
