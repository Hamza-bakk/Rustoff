require "test_helper"

class RefundPolicyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get refund_policy_index_url
    assert_response :success
  end
end
