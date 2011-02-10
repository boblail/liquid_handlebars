require 'erb'

module Templates
  class Base
    
    
    
    def initialize(context)
      @__context = stringify(context)
      context.each {|key, value| instance_variable_set("@#{key}", value) }
      setup
    end
    
    
    
    def setup
      liquid_precompiled
      handlebars_precompiled
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
    
    def liquid_precompiled
      @liquid_precompiled ||= Liquid::Template.parse(self.liquid)
    end
    
    def handlebars_precompiled
      @handlebars_precompiled ||= Handlebars.compile(self.handlebars)
    end
    
    
    
    def render(kind)
      case kind
      when :erb;              ERB.new(self.erb).result(binding)
      when :liquid;           Liquid::Template.parse(self.liquid).render(@__context)
      when :handlebars;       Handlebars.compile(self.handlebars).call(@__context)
      when :liquid_pre;       liquid_precompiled.render(@__context)
      when :handlebars_pre;   handlebars_precompiled.call(@__context)
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
