require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
  	@base_title = "sample_app"
  end


  test "should get hello" do
    get :hello
    assert_response :success
    assert_select "title", "hello | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "about | #{@base_title}"
  end


  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "contact | #{@base_title}"
  end


 
end
