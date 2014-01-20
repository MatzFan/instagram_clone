# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Bruce'
    email 'bruce@me.com'
    password 'password'
  end
end
