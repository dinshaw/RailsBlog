class PostsController < ApplicationController  
  before_filter :get_post, :only => :show

  def index
    params[:post_search] ||= {}

    @post_search = PostSearch.new(params[:post_search])

    @posts = Post.search(
      @post_search.keywords,
      :conditions => @post_search.conditions,
      :order => :created_at, 
      :sort_mode => :desc,
      :page => params[:page] || 1,
      :per_page => params[:per_page] || 6
    )
  end

  private 
  def get_post
    @post = Post.find(params[:id])
    redirect_to @post, :status => :moved_permanently if @post.has_better_id?
  end
end