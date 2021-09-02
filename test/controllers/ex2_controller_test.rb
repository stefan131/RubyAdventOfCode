require "test_helper"

class Ex2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ex2_index_url
    assert_response :success
  end
end
