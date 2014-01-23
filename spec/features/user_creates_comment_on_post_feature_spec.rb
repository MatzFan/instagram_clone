require 'spec_helper'

describe "authenticated user creating comment on an existing post" do

  before do
    # create is factory girl
    user = create(:user)
    # login_as is Warden method for Capy - see spec_helper
    login_as user, scope: :user
    @post = create(:post)
  end

  after do
    Warden.test_reset!
  end

  context "with a text content" do
    it "should result in that content displayed on /posts" do
      visit '/'
      click_button 'Add comment'
      fill_in 'Text', with: 'This is my comment'
      expect(current_path).to eq new_post_comment_path(@post)
      click_button 'Create Comment'
      expect(current_path).to eq('/posts')
      expect(page).to have_content 'This is my comment'
    end
  end

end # of class
