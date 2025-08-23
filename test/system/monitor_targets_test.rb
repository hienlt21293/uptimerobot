require "application_system_test_case"

class MonitorTargetsTest < ApplicationSystemTestCase
  setup do
    @monitor_target = monitor_targets(:one)
  end

  test "visiting the index" do
    visit monitor_targets_url
    assert_selector "h1", text: "Monitor targets"
  end

  test "should create monitor target" do
    visit monitor_targets_url
    click_on "New monitor target"

    fill_in "Name", with: @monitor_target.name
    fill_in "Status", with: @monitor_target.status
    fill_in "Url", with: @monitor_target.url
    click_on "Create Monitor target"

    assert_text "Monitor target was successfully created"
    click_on "Back"
  end

  test "should update Monitor target" do
    visit monitor_target_url(@monitor_target)
    click_on "Edit this monitor target", match: :first

    fill_in "Name", with: @monitor_target.name
    fill_in "Status", with: @monitor_target.status
    fill_in "Url", with: @monitor_target.url
    click_on "Update Monitor target"

    assert_text "Monitor target was successfully updated"
    click_on "Back"
  end

  test "should destroy Monitor target" do
    visit monitor_target_url(@monitor_target)
    accept_confirm { click_on "Destroy this monitor target", match: :first }

    assert_text "Monitor target was successfully destroyed"
  end
end
