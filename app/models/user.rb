class User < ActiveRecord::Base
	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates   :firstName,
				:presence => true

	validates   :lastName,
				:presence => true

	validates   :user,
				:length => {:within => 4..25, :message => "nazwa użytkownika musi zawierać się pomiezy 4 a 25 zanków"},
				:uniqueness => true

	validates :email,
			  :presence => true,
			  :length => {:maximum => 100},
			  :format => EMAIL_REGEX,
			  :confirmation => true

	scope :sortuj, lambda{order("firstName ASC, lastName ASC")}

end
