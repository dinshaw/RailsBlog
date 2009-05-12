class PostsController < ApplicationController  
  before_filter :get_post, :only => :show  
  def index
    @posts = Post.all
  end
  
  def show
    
  end
  
  private 
  def get_post
    @post = Post.find(params[:id])
    redirect_to @post, :status => :moved_permanently if @post.has_better_id?
  end
end