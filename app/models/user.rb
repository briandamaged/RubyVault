class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username, :ssn
  
  validates :username, :presence => true,
                       :uniqueness => true

  validates :password, :presence => true,
                       :confirmation => true

  validates :email, :presence => true

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  
  validates :ssn, :presence => true,
                  :format => {:with => /\d{3}-?\d{2}-?\d{4}/,
                              :message => "must consist of 9 digits"}
end
