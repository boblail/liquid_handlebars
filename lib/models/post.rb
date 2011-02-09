class Post < Struct.new(:title, :body, :date, :author, :comments)
  
  liquid_methods :title, :body, :date, :author, :comments
  
  def initialize(attributes)
    attributes.each {|key, value| send("#{key}=", value)}
  end
  
end
