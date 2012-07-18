require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get reset_password" do
    get :reset_password
    assert_response :success
  end

end
