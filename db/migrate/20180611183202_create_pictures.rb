class CreatePictures < ActiveRecord::Migration
  def up
    create_table :pictures do |t|
      t.string "name", limit: 60
      t.string "category", limit: 30
      t.string "description", limit: 50
      t.attachment :picture
      t.timestamps
    end
  end
  def down
    drop_table :pictures
  end
end
