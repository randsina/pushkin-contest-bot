require 'test_helper'

class ContestsControllerTest < ActionController::TestCase
  test "should get registration" do
    get :registration
    assert_response :success
  end

  test "should get quiz" do
    get :quiz
    assert_response :success
  end

end
