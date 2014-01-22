# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    product_id 1
    user nil
    cost "9.99"
    precision ""
    scale ""
  end
end
