# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user nil
    text nil
    commit_id "MyString"
    line_number 1
    body "MyText"
  end
end
