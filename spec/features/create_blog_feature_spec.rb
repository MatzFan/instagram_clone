require 'spec_helper'

describe "creating a new post" do
  context "with a title" do
    it "should result in a new post rendered at '/post'" do
      visit 'posts/new'
      fill_in 'Title', with: 'My new post'
      click_button 'Create Post'
      expect(page).to have_content 'My new post'
      expect(current_path).to eq('/posts')
    end
  end
end # end of describe
