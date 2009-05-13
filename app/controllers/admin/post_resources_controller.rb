class Admin::PostResourcesController < ApplicationController
  before_filter :get_post
  
  def get_post
    @post = Post.find(params[:post_id])
  end
  
 def up
  @post.post_resources.find(params[:id]).move_higher
  redirect_to edit_admin_post_path(@post)
 end
end
