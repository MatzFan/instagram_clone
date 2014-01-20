require 'spec_helper'

describe "creating a new post" do
  context "with a title" do
    it "should result in a new post rendered at '/posts'" do
      visit 'posts/new'
      fill_in 'Title', with: 'My new post'
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_content 'My new post'

    end
  end

  context "with an image" do
    it "should result in a new image rendered at '/posts'" do
      visit 'posts/new'
      fill_in 'Title', with: 'My picture'
      # attach_file is a Capy method
      attach_file('Image', Rails.root.join('spec/images/me.jpg'))
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_css('img.instagram-upload')
    end
  end

end # end of describe
