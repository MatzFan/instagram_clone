class AddUserIdToPosts < ActiveRecord::Migration
  def change
    # this adds user ref to posts - i.e. post is child of user
    add_reference :posts, :user, index: true
    # foreigner gem allows FK's t be created like so:-
    add_foreign_key(:user, :posts)
  end
end
