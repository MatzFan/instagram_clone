# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    title "A post"
    image { fixture_file_upload(Rails.root.join('spec', 'images', 'me.jpg'), 'image/jpg') }
  end
end
