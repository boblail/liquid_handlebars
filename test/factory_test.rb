require File.dirname(__FILE__) + '/test_helper.rb'

class FactoryTest < Test::Unit::TestCase
  
  def test_posts
    posts = Factory.posts
    assert_equal 1, posts.length
    assert_equal "Hello World", posts.first.title
    assert_equal 2, posts.first.comments.length
  end
  
end
