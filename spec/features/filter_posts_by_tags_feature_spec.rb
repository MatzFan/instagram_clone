require 'spec_helper'

describe "filtering posts by tags" do

  before do
    # create is factory girl
    user = create(:user)
    # login_as is Warden method for Capy - see spec_helper
    login_as user, scope: :user
  end

  after do
    Warden.test_reset!
  end

  context "with a given tag" do
    it "should result in only tagged posts displayed" do
      tag = create(:tag, name: 'lol')
      tagged_post = create(:post, title: 'A tagged post')
      create(:post, title: 'Untagged post')
      # add tag to the tagged post
      tagged_post.tags << tag
      visit '/posts'
      expect(page).to have_content('Untagged post')
      click_link('lol')
      expect(page).not_to have_content('Untagged post')
    end
  end

end # of describe
