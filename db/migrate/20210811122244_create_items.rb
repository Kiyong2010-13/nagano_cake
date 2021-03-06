class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.string :image_id, null: false, default: ""
      t.text :introduction, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.boolean :is_active, default: true, null: false
      t.integer :genre_id, null: false, default: ""
      

      t.timestamps
    end
  end
end
