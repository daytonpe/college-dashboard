require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get toggle" do
    get checklists_toggle_url
    assert_response :success
  end

end
