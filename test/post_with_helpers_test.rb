require File.dirname(__FILE__) + '/test_helper.rb'

class PostWithHelpersTest < Test::Unit::TestCase
  include TemplateTestHelper
  
  def setup
    prepare_template(:posts => Factory.posts)
    template.add_helper('format_date', lambda {|date| date.strftime('%B %Y') })
  end
  
  
  
  def html
  <<-HTML
    <ol>
      <li>
        <h3>Hello World</h3>
        <p>February 2011</p>
      </li>
    </ol>
  HTML
  end
  
  def erb
  <<-ERB
    <ol>
      <% @posts.each do |post| %><li>
        <h3><%= post.title %></h3>
        <p><%= post.date.strftime('%B %Y') %></p>
      </li><% end %>
    </ol>
  ERB
  end
  
  def liquid
  <<-LIQUID
    <ol>
      {% for post in posts %}<li>
        <h3>{{post.title}}</h3>
        <p>{{post.date | format_date}}</p>
      </li>{% endfor %}
    </ol>
  LIQUID
  end
  
  def handlebars
  <<-HANDLEBARS
    <ol>
      {{#posts}}<li>
        <h3>{{title}}</h3>
        <p>{{{format_date date}}}</p>
      </li>{{/posts}}
    </ol>
  HANDLEBARS
  end
  
  
  
end
