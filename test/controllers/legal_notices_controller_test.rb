require "test_helper"

class LegalNoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get legal_notices_index_url
    assert_response :success
  end
end
