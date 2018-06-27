require 'test_helper'
require 'categories_controller'

# Re-raise errors caught by the controller.
class CategoriesController
  def rescue_action(e)
    raise e
  end
end

class CategoriesControllerTest < ActionController::TestCase
  fixtures :categories

  def setup
    @controller = CategoriesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  def test_edycja
    get :edycja, :id => 1
    # assert_not_nil assigns(:kategoria)
    assert_response :success
  end


end
