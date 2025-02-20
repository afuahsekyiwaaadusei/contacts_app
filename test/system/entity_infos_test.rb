require "application_system_test_case"

class EntityInfosTest < ApplicationSystemTestCase
  setup do
    @entity_info = entity_infos(:one)
  end

  test "visiting the index" do
    visit entity_infos_url
    assert_selector "h1", text: "Entity infos"
  end

  test "should create entity info" do
    visit entity_infos_url
    click_on "New entity info"

    check "Active status" if @entity_info.active_status
    fill_in "Assigned code", with: @entity_info.assigned_code
    check "Del status" if @entity_info.del_status
    fill_in "Entity alias", with: @entity_info.entity_alias
    fill_in "Entity name", with: @entity_info.entity_name
    fill_in "Narration", with: @entity_info.narration
    fill_in "User", with: @entity_info.user_id
    click_on "Create Entity info"

    assert_text "Entity info was successfully created"
    click_on "Back"
  end

  test "should update Entity info" do
    visit entity_info_url(@entity_info)
    click_on "Edit this entity info", match: :first

    check "Active status" if @entity_info.active_status
    fill_in "Assigned code", with: @entity_info.assigned_code
    check "Del status" if @entity_info.del_status
    fill_in "Entity alias", with: @entity_info.entity_alias
    fill_in "Entity name", with: @entity_info.entity_name
    fill_in "Narration", with: @entity_info.narration
    fill_in "User", with: @entity_info.user_id
    click_on "Update Entity info"

    assert_text "Entity info was successfully updated"
    click_on "Back"
  end

  test "should destroy Entity info" do
    visit entity_info_url(@entity_info)
    click_on "Destroy this entity info", match: :first

    assert_text "Entity info was successfully destroyed"
  end
end
