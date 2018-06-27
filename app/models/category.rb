class Category < ActiveRecord::Base
	has_many :products, class_name: "Product"
	scope :sortuj, lambda{order("categories.name ASC")}
end
