
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
    @user = User.new
  end
  
  def create_account
    @user = User.new(params[:user])
    @user.ssn = cookies[:ssn]
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render :choose_credentials
    end
  end
  
end
