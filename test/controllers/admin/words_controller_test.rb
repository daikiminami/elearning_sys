require 'test_helper'

class Admin::WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_words_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_words_edit_url
    assert_response :success
  end

end
