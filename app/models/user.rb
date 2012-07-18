class User < ActiveRecord::Base
  has_many :accounts
  
  alias_attribute :is_admin?, :is_admin
  
  after_initialize :set_defaults
  
  
  validates :username, :presence => true,
                       :uniqueness => true

  validates :password, :presence => true,
                       :confirmation => true

  validates :email, :presence => true,
                    :email_format => true

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  
  validates :ssn, :presence   => true,
                  :ssn_format => true


  private
  def set_defaults
    # If the end-user did not specify any admin privilege,
    # then we assume that they are not an administrator.
    self.is_admin ||= false
  end
end
