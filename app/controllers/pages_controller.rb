class PagesController < ApplicationController
  
  def homepage
    @images = Image.all
    @recent = Image.find(:all, :order => "created_at desc", :limit => 4).reverse
    @reviews = Review.all
    @posts = Post.all
  end
end

