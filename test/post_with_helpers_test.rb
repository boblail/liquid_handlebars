require File.dirname(__FILE__) + '/test_helper.rb'

class PostWithHelpersTest < Test::Unit::TestCase
  include TemplateTestHelper
  
  def setup
    @template = Templates::PostWithHelpers.new(:posts => Factory.posts)
    @expected_html = <<-HTML
      <ol>
        <li>
          <h3>Hello World</h3>
          <p>February 2011</p>
        </li>
      </ol>
      HTML
  end
  
end
