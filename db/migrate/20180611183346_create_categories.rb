class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
    	t.string "name", limit: 50

      t.timestamps
  end 
end
      def down
      	drop_table :categories
    end
  end
