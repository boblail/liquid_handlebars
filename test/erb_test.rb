require File.dirname(__FILE__) + '/test_helper.rb'

class ErbTest < Test::Unit::TestCase
  
  def test_erb
    expected_html = <<-HTML
      <ol>
        <li>
          <h3>Hello World</h3>
          <p>Factory</p>
        </li>
      </ol>
      HTML
    assert_equal expected_html, Templates::SimplePost.new.html
  end
  
end
