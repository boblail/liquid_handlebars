require File.dirname(__FILE__) + '/test_helper.rb'


module TemplateTestHelper
  
  
  def test_sanity
    assert_equal expected_html, template.render(:erb)
  end
  
  
  def test_liquid
    assert_equal expected_html, template.render(:liquid)
  end
  
  
  def test_handlebars
    assert_equal expected_html, template.render(:handlebars)
  end
  
  
  def test_performance
    Benchmark.bmbm do |b|
      b.report("erb:")        { times.times {template.render(:erb)}         }
      b.report("liquid:")     { times.times {template.render(:liquid)}      }
      b.report("handlebars:") { times.times {template.render(:handlebars)}  }
    end
  end
  
  
protected
  
  
  def times
    1000
  end
  
  
  def template
    @template ||= eval("Templates::#{template_class}").new
  end
  
  
  def template_class
    @template_class ||= self.class.name.match(/(.*)Test/)[1]
  end
  
  
  def expected_html
    @expected_html || raise(NotImplementedError)
  end
  
  
end
