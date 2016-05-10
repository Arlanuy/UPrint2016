require 'test_helper'

class TransactionsControllerTest < ActionController::TestCase
  test "should get crecreate" do
    get :crecreate
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end
end
