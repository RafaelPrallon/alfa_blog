require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
  
  def setup
    @article = Article.create(title: "test", description: "test", user_id: 1)
    @category = Category.create(name: "teste")
    @articlecategory = ArticleCategory.new(article_id: 1, category_id: 1)
  end
  
  test "article_category is valid" do
    assert @articlecategory.valid?
  end
  
  test "does assossiation works" do
    @article.categories << @category
    assert_not @article.categories.nil?
    assert_not @category.articles.nil?
  end
end