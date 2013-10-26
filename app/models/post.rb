class Post < ActiveRecord::Base  
  
  
  def self.get_data
  
    @oauth = Koala::Facebook::OAuth.new("173929526142774", "abf49b7705d99ca0d251dbaaa7a9cca7", "http://www.creacces.nl")
  
  
  end
  
end





