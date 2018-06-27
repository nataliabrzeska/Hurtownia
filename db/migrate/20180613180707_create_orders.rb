class CreateOrders < ActiveRecord::Migration
    def up
    create_table :orders do |t|
      t.string "product_id"
      t.string "status", limit: 60 
      t.string "name", limit: 60
      t.string "lastName", limit: 50
      t.string "address", limit: 30
      t.integer "telephone", limit: 50
      t.string "email", limit: 50
      t.integer "quantity", default: 0
      
     
      t.timestamps
    end
    add_index("orders", "product_id")
  

  end
  def down
    drop_table :orders
  end
end