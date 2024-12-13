require "test_helper"

class RecyclersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recyclers_index_url
    assert_response :success
  end

  test "should get show" do
    get recyclers_show_url
    assert_response :success
  end

  test "should get new" do
    get recyclers_new_url
    assert_response :success
  end

  test "should get create" do
    get recyclers_create_url
    assert_response :success
  end

  test "should get edit" do
    get recyclers_edit_url
    assert_response :success
  end

  test "should get update" do
    get recyclers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recyclers_destroy_url
    assert_response :success
  end
end
