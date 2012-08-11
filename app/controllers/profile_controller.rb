
class ProfileController < ApplicationController

  before_filter :verify_logged_in

  def view
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to profile_path(:view), notice: 'Profile has been updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def change_password
    @change_password = ChangePassword.new
  end
  
  
  def do_change_password
    @change_password = ChangePassword.new(params[:change_password])
    
    if @change_password.valid?
      
    else
      render action: "change_password"
    end
    
  end
  
  
  private
  
  def verify_logged_in
    if not logged_in?
      redirect_to :welcome
    end
  end
end
