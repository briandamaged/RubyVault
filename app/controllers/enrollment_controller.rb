
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
    
    # Associate the user w/ the account number they provided
    @user.accounts << create_monetary_account(cookies[:account_number])
    
    
    # We "pretend" that we discovered these additional accounts
    # when we looked up the user's information.
    rand(1..3).times do
      @user.accounts << create_monetary_account(find_unused_account_number)
    end
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      render :choose_credentials
    end
  end
  
  
  private
  
  def find_unused_account_number
    loop do
      account_no = (1..16).map{ rand(0..9) }.join
      return account_no unless Account.find_by_account_number(account_no)
    end
  end
  
  def create_monetary_account(account_number)
    Account.new(
      :account_number => account_number,
      :account_type => AccountType.random,
      :balance => rand(100..3000)
    )
  end
  
end
