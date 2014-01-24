require 'spec_helper'

describe "authenticated user editing a post" do

  before do
    user = create(:user)
    login_as user, scope: :user
    create(:post, user: user)
  end

  after do
    Warden.test_reset!
  end

  context "with a new title" do
    it "should result in the amended post rendered at '/posts'" do
      visit 'posts/'
      click_link 'Edit'
      fill_in 'Title', with: 'My amended post'
      click_button 'Update Post'
      expect(current_path).to eq('/posts')
      expect(page).to have_content 'My amended post'

    end
  end

end # of describe
