# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user ""
    text ""
    commit_id "MyString"
    line_number ""
    body "MyText"
  end
end
