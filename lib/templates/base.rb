require 'erb'

module Templates
  class Base
  
    def liquid
      raise NotImplementedError
    end
  
    def handlebars
      raise NotImplementedError
    end
  
    def erb
      raise NotImplementedError
    end
  
    def html
      @html ||= ERB.new(erb).result(binding)
    end
  
  end
end
