class CommentsController < ApplicationController
  before_filter :get_post
  def get_post
    @post = Post.find(params[:post_id])
  end
  # GET /admin/posts
  # GET /admin/posts.xml
  def index
    @comments = @post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /admin/posts/new
  # GET /admin/posts/new.xml
  def new
    @comment = @post.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /admin/posts/1/edit
  def edit
    @comment = @post.comments.find(params[:id])
  end

  # POST /admin/posts
  # POST /admin/posts.xml
  def create
    @comment = @post.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(post_path(@post)) }
        format.xml  { render :xml => @comment, :status => :created, :location => ['admin', @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/posts/1
  # PUT /admin/posts/1.xml
  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(post_path(@post)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.xml
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_path(@post)) }
      format.xml  { head :ok }
    end
  end


end