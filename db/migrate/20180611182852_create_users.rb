class CreateUsers < ActiveRecord::Migration
def up
		create_table :users do |t|
			t.string "firstName", limit: 20
			t.string "lastName", limit: 60
			t.string "user", limit: 25
			t.string "email", limit: 100
			t.string "address", limit: 60
			t.string "street", limit: 50
			t.integer "phone", limit: 70
			t.string "password_digest"
			t.timestamps
		end
		add_index("users","user")
	end

	def down
		drop_table :users
	end
end
