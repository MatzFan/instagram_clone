require 'spec_helper'

describe "authenticated user deleting a post" do

  before do
    # create is factory girl
    user = create(:user)
    # login_as is Warden method for Capy - see spec_helper
    login_as user, scope: :user
    # need a post too - factory girl again :)
    post = create(:post)
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
