require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "test", email: "test@example.com", password: "password")
  end
  
  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "test", description: "testing article creation"}
    end
    assert_template 'articles/show'
    assert_match "testing article creation", response.body
  end
  
   
  test "invalid article results in failure" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_no_difference 'Article.count' do
      post articles_path, article: {name: " "}
    end
    assert_template 'articles/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end