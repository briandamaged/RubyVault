require 'test_helper'

class EnrollmentControllerTest < ActionController::TestCase
  test "should get state_identity" do
    get :state_identity
    assert_response :success
  end

  test "should get verify_identity" do
    get :verify_identity
    assert_response :success
  end

end
