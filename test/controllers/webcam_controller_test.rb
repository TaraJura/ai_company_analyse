require "test_helper"

class WebcamControllerTest < ActionDispatch::IntegrationTest
  test "should get capture" do
    get webcam_capture_url
    assert_response :success
  end
end
