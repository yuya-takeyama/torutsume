FactoryGirl.define do
  factory :user, :class => User do
    id { 1000 }
    email { 'testuser@example.com' }
    password { 'password' }
  end
end
