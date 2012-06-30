class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username, :ssn, :is_admin
  
  has_many :accounts
  
  alias_attribute :is_admin?, :is_admin
  
  after_initialize :set_defaults
  
  
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


  private
  def set_defaults
    # If the end-user did not specify any admin privilege,
    # then we assume that they are not an administrator.
    self.is_admin ||= false
  end
end
