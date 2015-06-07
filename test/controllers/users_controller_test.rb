require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
  	@base_title = "sample_app"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "sign-up | #{@base_title}"
  end

end
