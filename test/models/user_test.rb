require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Adam", email: "adam.mclean1@gmail.com", password: "foobar", password_confirmation: "foobar")
  end

  test "email addresses should be saved as lower-case" do
  	mixed_case_email = "Foo@ExAMPLE.CoM"
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
