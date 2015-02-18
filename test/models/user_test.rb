require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Adam", email: "adam.mclean1@gmail.com", password: "foobar", password_confirmation: "foobar")
  end
end
