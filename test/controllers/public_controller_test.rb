require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get product" do
    get :product, :id => 1
    assert_response :success
  end

  test "should get nowosci" do
    get :nowosci
    assert_response :success
  end

end
