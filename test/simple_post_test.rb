require File.dirname(__FILE__) + '/test_helper.rb'

class SimplePostTest < Test::Unit::TestCase
  include TemplateTestHelper
  
  def setup
    @template = Templates::SimplePost.new(:posts => Factory.posts)
    @expected_html = <<-HTML
      <ol>
        <li>
          <h3>Hello World</h3>
          <p>Factory</p>
        </li>
      </ol>
      HTML
  end
  
end
