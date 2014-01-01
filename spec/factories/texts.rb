# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :text do
    user nil
    subject "MyString"
    body "MyText"
  end
end
