require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without name" do
    user = users(:user_without_name)
    assert_not user.save
  end

  test "user by default is student" do
    user = User.new
    assert_equal("Student",user.role)
  # assert_equal("three",users(:user_11).role,"name mismatch")
  end

end

