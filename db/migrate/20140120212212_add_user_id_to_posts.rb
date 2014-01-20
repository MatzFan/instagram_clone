class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_foreign_key(:posts, :users)
    # add_reference :posts, :user, index: true
  end
end
