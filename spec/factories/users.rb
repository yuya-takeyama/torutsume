FactoryGirl.define do
  sequence :username do |n|
    "testuser#{n}"
  end

  sequence :email do |n|
    "testuser#{n}@example.com"
  end

  factory :user, :class => User do
    username 'testuser'
    email    'testuser@example.com'
    password 'password'
  end

  factory :users, :class => User do
    username
    email
    password 'password'
  end
end
