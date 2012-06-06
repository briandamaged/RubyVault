class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username
  
  validates :username, :presence => true,
                       :uniqueness => true

  validates :password, :presence => true,
                       :confirmation => true

  validates :email, :presence => true

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  
end
