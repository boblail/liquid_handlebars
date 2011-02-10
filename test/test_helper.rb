require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'test/unit'
require 'benchmark'

require 'factory'
require 'templates'

BENCHMARK_TIMES = (ENV['TIMES'] || 1000).to_i



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
    puts ""
    puts "#{template_class} Benchmark:"
    Benchmark.bmbm do |b|
      b.report("erb:")                      { times.times {template.render(:erb)}           }
      b.report("liquid:")                   { times.times {template.render(:liquid)}        }
      b.report("handlebars:")               { times.times {template.render(:handlebars)}    }
      b.report("liquid (precompiled):")     { times.times {template.render(:liquid_pre)}    }
      b.report("handlebars (precompiled):") { times.times {template.render(:handlebars_pre)}}
    end
    puts ""
  end
  
  
protected
  
  
  def times
    BENCHMARK_TIMES
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