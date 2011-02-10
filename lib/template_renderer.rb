require 'erb'

class TemplateRenderer
  
  
  
  def initialize(context)
    @__context = stringify(context)
    context.each {|key, value| instance_variable_set("@#{key}", value) }
    @liquid_filters = []
  end
  
  
  
  # def setup
  #   liquid_precompiled
  #   handlebars_precompiled
  # end
  
  attr_accessor :erb, :liquid, :handlebars, :html
  
  def liquid_precompiled
    @liquid_precompiled ||= Liquid::Template.parse(self.liquid)
  end
  
  def handlebars_precompiled
    @handlebars_precompiled ||= Handlebars.compile(self.handlebars)
  end
  
  
  
  def render(kind)
    case kind
    when :erb;              ERB.new(self.erb).result(binding)
    when :liquid;           Liquid::Template.parse(self.liquid).render(@__context, :filters => @liquid_filters)
    when :handlebars;       Handlebars.compile(self.handlebars).call(@__context)
    when :liquid_pre;       liquid_precompiled.render(@__context)
    when :handlebars_pre;   handlebars_precompiled.call(@__context)
    end
  end
  
  
  
  def add_helper(name, fn)
    add_handlebars_helper(name, fn)
    add_liquid_helper(name, fn)
  end
  
  def add_handlebars_helper(name, fn)
    Handlebars.registerHelper(name, fn)
  end
  
  def add_liquid_helper(name, fn)
    helper_module = Module.new
    helper_module.send(:define_method, name, fn)
    @liquid_filters << helper_module
  end
  
  
  
private
  
  
  
  def stringify(hash)
    hash.inject({}) do |options, (key, value)|
      options[key.to_s] = value
      options
    end
  end
  
  
  
end
