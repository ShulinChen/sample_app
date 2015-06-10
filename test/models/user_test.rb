require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "testUser", email: "test@gmail.com",
                    password: "abcdef", password_confirmation: "abcdef")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "  "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "  "
  	assert_not @user.valid?
  end

  test "name should not be longer than 20" do 
  	@user.name = "a" * 21
  	assert_not @user.valid?
  end

  test "email should not be longer than 20" do 
  	@user.name = "a" * 21 + "@gmail.com"
  	assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    dup = @user.dup
    dup.email = @user.email.upcase
    @user.save
    assert_not dup.valid?
  end

  test "password cant be blank" do
    @user.password = @user.password_confirmation = "    "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email addr should be saved as lower case" do
    @user.email = "foobFFrrrr@gmail.com"
    temp = @user.dup
    @user.save
    assert_equal @user.reload.email, temp.email.downcase
  end





end
