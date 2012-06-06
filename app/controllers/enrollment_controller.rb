
class EnrollmentController < ApplicationController
  def state_identity
    @identification = Identification.new
  end

  def verify_identity
    @identification = Identification.new(params[:identification])
    
    if @identification.valid?
      redirect_to welcome_path
    else
      render :state_identity
    end
    
  end
end
