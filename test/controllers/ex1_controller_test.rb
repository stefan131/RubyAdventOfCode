require "test_helper"

class Ex1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ex1_index_url
    assert_response :success
  end
end
