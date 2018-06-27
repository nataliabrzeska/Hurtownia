require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get order" do
    get :order
    assert_response :success
  end

end
