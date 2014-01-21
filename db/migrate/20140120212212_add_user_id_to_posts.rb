class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_foreign_key(:posts, :users)
  end
end
