require "test_helper"

class MonitorTargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitor_target = monitor_targets(:one)
  end

  test "should get index" do
    get monitor_targets_url
    assert_response :success
  end

  test "should get new" do
    get new_monitor_target_url
    assert_response :success
  end

  test "should create monitor_target" do
    assert_difference("MonitorTarget.count") do
      post monitor_targets_url, params: { monitor_target: { name: @monitor_target.name, status: @monitor_target.status, url: @monitor_target.url } }
    end

    assert_redirected_to monitor_target_url(MonitorTarget.last)
  end

  test "should show monitor_target" do
    get monitor_target_url(@monitor_target)
    assert_response :success
  end

  test "should get edit" do
    get edit_monitor_target_url(@monitor_target)
    assert_response :success
  end

  test "should update monitor_target" do
    patch monitor_target_url(@monitor_target), params: { monitor_target: { name: @monitor_target.name, status: @monitor_target.status, url: @monitor_target.url } }
    assert_redirected_to monitor_target_url(@monitor_target)
  end

  test "should destroy monitor_target" do
    assert_difference("MonitorTarget.count", -1) do
      delete monitor_target_url(@monitor_target)
    end

    assert_redirected_to monitor_targets_url
  end
end
