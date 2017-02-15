require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  
  test "sign up user" do
    get signup_path
    assert_template 'users/new'
    assert_difference "User.count", 1 do
      post_via_redirect users_path, user: {username: "teste", email: "teste@example.com", password: "senha"}
    end
    assert_template 'users/show'
    assert_match "teste", response.body
  end
end