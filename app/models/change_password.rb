
# This class represents a request for a user to change
# their own password.
class ChangePassword
  include ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveRecord::Validations  

  attr_accessor :current_password, :new_password

  validates :current_password, :presence => true


  validates :new_password, :presence => true,
                           :confirmation => true


  def initialize(params = {})
    @current_password          = params[:current_password]
    @new_password              = params[:new_password]
    @new_password_confirmation = params[:new_password_confirmation]
  end


  def new_record?
    true
  end

  def persisted?
    false
  end

end
