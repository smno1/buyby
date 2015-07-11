require 'test_helper'

class ManagementControllerControllerTest < ActionController::TestCase
  test "should get offer_management" do
    get :offer_management
    assert_response :success
  end

  test "should get user_management" do
    get :user_management
    assert_response :success
  end

  test "should get request_management" do
    get :request_management
    assert_response :success
  end

end
