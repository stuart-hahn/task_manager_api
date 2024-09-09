require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @team = Team.create(name: "Test Team")
    @user = User.new(name: "John Doe", email: "john@example.com", password: "password", team: @team)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "team association should be present" do
    @user.team = nil
    assert_not @user.valid?
  end
end
