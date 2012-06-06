
class EnrollmentController < ApplicationController
  def state_identity
    @identification = Identification.new
  end

  def verify_identity
    @identification = Identification.new(params[:identification])
    
    if @identification.valid?
      cookies[:ssn]            = @identification.ssn
      cookies[:account_number] = @identification.account_number
      
      redirect_to choose_credentials_path
    else
      render :state_identity
    end
    
  end
  
  
  def choose_credentials
    # @desired_credentials = DesiredCredentials.new
  end
  
end
