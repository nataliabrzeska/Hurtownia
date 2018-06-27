class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string "name", limit: 60
      t.float "price", limit: 50
      t.string "description", limit: 50
      t.string "category_id"
      t.attachment :picture
      t.timestamps
    end
    add_index("products", "category_id")


  end

  def down
    drop_table :products
  end
end




