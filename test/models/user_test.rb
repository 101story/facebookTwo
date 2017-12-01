require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user email validation(right)" do
    user = User.new({
      email: "zxcv@zxcvg.com",
      password: "zxcvzxcv",
      password_confirmation: "zxcvzxcv"
    })
    assert user.save, 'validation success'
  end

  test "user email validation(wrong)" do
    user = User.new({
      email: "asdf",
      password: "asdfasdf",
      password_confirmation: "asdfasdf"
    })
    refute user.save, 'validation success'
  end
end
