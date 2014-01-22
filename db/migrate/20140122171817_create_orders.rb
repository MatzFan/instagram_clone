class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.decimal :product_cost, precision: 8, scale: 2
      t.belongs_to :user, index: true

      t.timestamps
    end
    add_foreign_key(:orders, :users)
  end
end
