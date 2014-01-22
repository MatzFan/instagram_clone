# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    title "A post"
    price 1000
    tag_names "" # fixture with no tags
    image { fixture_file_upload(Rails.root.join('spec', 'images', 'me.jpg'), 'image/jpg') }
  end
end
