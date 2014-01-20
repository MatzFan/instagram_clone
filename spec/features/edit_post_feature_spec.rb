require 'spec_helper'

describe "authenticated user editing a post" do

  before do
    # create is factory girl
    user = create(:user)
    # login_as is Warden method for Capy - see spec_helper
    login_as user, scope: :user
  end

  context "with a new title" do
    it "should result in the amended post rendered at '/posts'" do
      visit 'posts/edit'
      fill_in 'Title', with: 'My new post'
      click_button 'Create Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_content 'My new post'

    end
  end

end # of describe
