require 'erb'

module Templates
  class Base
    
    
    
    def initialize(context)
      @__context = stringify(context)
      context.each {|key, value| instance_variable_set("@#{key}", value) }
    end
    
    
    
    def setup
      # do nothing
    end
    
    def erb
      raise NotImplementedError
    end
    
    def liquid
      raise NotImplementedError
    end
    
    def handlebars
      raise NotImplementedError
    end
    
    
    
    def render(kind)
      case kind
      when :erb;          setup; ERB.new(self.erb).result(binding)
      when :liquid;       setup; Liquid::Template.parse(self.liquid).render(@__context)
      when :handlebars;   setup; Handlebars.compile(self.handlebars).call(@__context)
      end
    end
    
    
    
  private
    
    
    
    def stringify(hash)
      hash.inject({}) do |options, (key, value)|
        options[key.to_s] = value
        options
      end
    end
    
    
    
  end
end
