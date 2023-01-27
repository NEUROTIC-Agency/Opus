require "test_helper"

class RecruitersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruiters_index_url
    assert_response :success
  end

  test "should get show" do
    get recruiters_show_url
    assert_response :success
  end
end
