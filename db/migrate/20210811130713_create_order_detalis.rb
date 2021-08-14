class CreateOrderDetalis < ActiveRecord::Migration[5.2]
  def change
    create_table :order_detalis do |t|
      t.integer :order_id, null: false, default: ""
      t.integer :item_id, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.integer :amount, null: false, default: ""
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
  end
end
