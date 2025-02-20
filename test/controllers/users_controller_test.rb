require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { active_status: @user.active_status, creator_id: @user.creator_id, del_status: @user.del_status, email: @user.email, first_login: @user.first_login, first_name: @user.first_name, image_path: @user.image_path, last_name: @user.last_name, mobile_number: @user.mobile_number, user_code: @user.user_code, username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { active_status: @user.active_status, creator_id: @user.creator_id, del_status: @user.del_status, email: @user.email, first_login: @user.first_login, first_name: @user.first_name, image_path: @user.image_path, last_name: @user.last_name, mobile_number: @user.mobile_number, user_code: @user.user_code, username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
