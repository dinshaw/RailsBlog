class Admin::PostsController < ApplicationController
  # GET /admin/posts
  # GET /admin/posts.xml
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /admin/posts/new
  # GET /admin/posts/new.xml
  def new
    @post = Post.new
    2.times{ @post.post_resources.build }
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /admin/posts/1/edit
  def edit
    @post = Post.find(params[:id])
        3.times{ @post.post_resources.build }
  end

  # POST /admin/posts
  # POST /admin/posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(['admin', @post]) }
        format.xml  { render :xml => @post, :status => :created, :location => ['admin', @post] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/posts/1
  # PUT /admin/posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(['admin', @post]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(admin_posts_url) }
      format.xml  { head :ok }
    end
  end
end
