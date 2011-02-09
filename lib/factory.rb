require 'models/post'

module Factory
  
  def self.posts
    @posts ||= [
      {
        :title => "Hello World",
        :author => "Factory",
        :body => "In the tradition of all good programing experiments...",
        :comments => [
          "Tweet.",
          "Tweet. Tweet."
        ]
      }
    ].map {|attributes| Post.new(attributes)}
  end
  
end
