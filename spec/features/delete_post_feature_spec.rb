require 'spec_helper'

describe "authenticated user deleting a post" do

  before do
    user = create(:user)
    login_as user, scope: :user
    create(:post, user: user)
  end

  after do
    Warden.test_reset!
  end

  context "with a title and image" do
    it "should result in the post being deleted from '/posts'" do
      visit 'posts/'
      expect(page).to have_content 'My new post'
      click_link 'Delete'
      expect(current_path).to eq('/posts')
      expect(page).not_to have_content 'My new post'
    end
  end

end # of describe
