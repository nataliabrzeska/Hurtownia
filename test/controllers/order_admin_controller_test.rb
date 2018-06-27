require 'test_helper'

class OrderAdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edycja" do
    get :edycja
    assert_response :success
  end

end
