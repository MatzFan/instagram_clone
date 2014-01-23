class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.text :text

      t.timestamps
    end
    add_foreign_key(:comments, :users)
  end
end
