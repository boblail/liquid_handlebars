require 'multi_json'

class Post < Struct.new(:title, :body, :date, :author, :comments)
  
  liquid_methods :title, :body, :date, :author, :comments
  
  def initialize(attributes)
    attributes.each {|key, value| send("#{key}=", value)}
  end
  
  def to_json
    hash = {}
    members.each do |key|
      hash[key] = self[key]
    end
    MultiJson.encode(hash)
  end
  
end

class Date
  
  def to_json
    "new Date(#{year}, #{month-1}, #{day})"
  end
  
end
