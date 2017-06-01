require 'test_helper'

class AnamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anam_index_url
    assert_response :success
  end

end
