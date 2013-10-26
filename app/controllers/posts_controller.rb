class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
        flash[:succes] =  "Post is succesvol aangemaakt"
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes!(case_params)
      respond_to do |format|
        format.html { redirect_to( @post)}
        format.json { render :json => @post }
      end
    else
      respond_to do |format|
        format.html { render :action => :edit }
        format.json { render :nothing => true }
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to cases_path
  end
  
  def post_params
    params.require(:post).permit(:message)
  end
end
