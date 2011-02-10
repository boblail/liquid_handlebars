require File.dirname(__FILE__) + '/test_helper.rb'

class SimplePostTest < Test::Unit::TestCase
  include TemplateTestHelper
  
  def setup
    prepare_template(:posts => Factory.posts)
  end
  
  
  
  def html
    <<-HTML
    <ol>
      <li>
        <h3>Hello World</h3>
        <p>Factory</p>
      </li>
    </ol>
    HTML
  end
  
  def liquid
  <<-LIQUID
    <ol>
      {% for post in posts %}<li>
        <h3>{{post.title}}</h3>
        <p>{{post.author}}</p>
      </li>{% endfor %}
    </ol>
  LIQUID
  end
  
  def handlebars
  <<-HANDLEBARS
    <ol>
      {{#posts}}<li>
        <h3>{{title}}</h3>
        <p>{{author}}</p>
      </li>{{/posts}}
    </ol>
  HANDLEBARS
  end
  
  def erb
  <<-ERB
    <ol>
      <% @posts.each do |post| %><li>
        <h3><%= post.title %></h3>
        <p><%= post.author %></p>
      </li><% end %>
    </ol>
  ERB
  end
  
  
end
