class Post < Struct.new(:title, :body, :author, :comments)
  
  def initialize(attributes)
    attributes.each {|key, value| send("#{key}=", value)}
  end
  
end
