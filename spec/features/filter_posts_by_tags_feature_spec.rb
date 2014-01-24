require 'spec_helper'

describe "filtering posts by tags" do

  before do
    user = create(:user)
    login_as user, scope: :user
    tag = create(:tag, name: 'lol')
    tagged_post = create(:post, user: user, title: 'A tagged post')
    untagged_post = create(:post, user: user, title: 'An untagged post')
    tagged_post.tags << tag
  end

  after do
    Warden.test_reset!
  end

  context "with a given tag" do
    it "should result in only tagged posts displayed" do
      visit '/posts'
      expect(page).to have_content('untagged post')
      click_link('lol')
      expect(page).not_to have_content('untagged post')
    end
  end

end # of describe
