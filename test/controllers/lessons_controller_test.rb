require 'test_helper'

class LessonsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lessons_create_url
    assert_response :success
  end

  test "should get show" do
    get lessons_show_url
    assert_response :success
  end

end
