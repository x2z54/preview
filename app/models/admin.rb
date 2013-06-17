class Admin < ActiveRecord::Base
  attr_accessible :email, :password
  has_secure_password

  def self.search(search)
  	if search
    	where('email LIKE ?', "%#{search}%")
  	else
    	scoped
  	end
  end
end
