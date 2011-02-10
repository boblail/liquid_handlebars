module Templates
  class PostWithHelpers < Base
    
    def setup
      add_helper('format_date', lambda {|date| date.strftime('%B %Y') })
      super
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
end