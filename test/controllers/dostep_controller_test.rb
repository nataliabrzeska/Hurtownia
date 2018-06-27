require 'test_helper'

class DostepControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :redirect
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
