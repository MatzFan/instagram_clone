require 'spec_helper'

describe "authenticated user creating a new post" do

  before do
    user = create(:user)
    login_as user, scope: :user # login_as is Warden method for Capy - see spec_helper
  end

  after do
    Warden.test_reset!
  end

  context "with a title" do
    it "should result in a new post rendered at '/posts'" do
      visit 'posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Price', with: 10.00
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_content 'My new post'
    end
  end

  context "with a price" do
    it "should result in the price displayed at '/posts'" do
      visit 'posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Price', with: 8.99
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_content '£8.99'
    end
  end

  context "authenticated user with an image to upload" do
    it "should result in a new image rendered at '/posts'" do
      visit 'posts/new'
      fill_in 'Title', with: 'My picture'
      fill_in 'Price', with: 10.00
      # attach_file is a Capy method
      attach_file('Image', Rails.root.join('spec/images/me.jpg'))
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_css('img.instagram-upload')
    end
  end

  context "with space-separated tags" do
    it "should result in a new post rendered at '/posts' with the tags" do
      visit 'posts/new'
      fill_in 'Title', with: 'My new post'
      fill_in 'Price', with: 10.00
      fill_in 'tag-input', with: 'atag, btag'
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(Post.last.tags.count).to eq(2)
      expect(page).to have_content '#atag #btag'
    end
  end

end # end of describe
