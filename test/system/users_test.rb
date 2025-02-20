require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    check "Active status" if @user.active_status
    fill_in "Creator", with: @user.creator_id
    check "Del status" if @user.del_status
    fill_in "Email", with: @user.email
    check "First login" if @user.first_login
    fill_in "First name", with: @user.first_name
    fill_in "Image path", with: @user.image_path
    fill_in "Last name", with: @user.last_name
    fill_in "Mobile number", with: @user.mobile_number
    fill_in "User code", with: @user.user_code
    fill_in "Username", with: @user.username
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    check "Active status" if @user.active_status
    fill_in "Creator", with: @user.creator_id
    check "Del status" if @user.del_status
    fill_in "Email", with: @user.email
    check "First login" if @user.first_login
    fill_in "First name", with: @user.first_name
    fill_in "Image path", with: @user.image_path
    fill_in "Last name", with: @user.last_name
    fill_in "Mobile number", with: @user.mobile_number
    fill_in "User code", with: @user.user_code
    fill_in "Username", with: @user.username
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
