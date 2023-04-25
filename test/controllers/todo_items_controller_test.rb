require "test_helper"

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todo_items_new_url
    assert_response :success
  end
end
