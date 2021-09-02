require "test_helper"

class Ex3ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ex3_index_url
    assert_response :success
  end
end
