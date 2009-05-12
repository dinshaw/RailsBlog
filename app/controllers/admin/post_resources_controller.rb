class Admin::PostResourcesController < ApplicationController
  # GET /admin/post_resources
  # GET /admin/post_resources.xml
  def index
    @post_resources = PostResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post_resource }
    end
  end

  # GET /admin/post_resources/1
  # GET /admin/post_resources/1.xml
  def show
    @post_resource = PostResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post_resource }
    end
  end

  # GET /admin/post_resources/new
  # GET /admin/post_resources/new.xml
  def new
    @post_resource = PostResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post_resource }
    end
  end

  # GET /admin/post_resources/1/edit
  def edit
    @post_resource = PostResource.find(params[:id])
  end

  # POST /admin/post_resources
  # POST /admin/post_resources.xml
  def create
    @post_resource = PostResource.new(params[:post_resource])

    respond_to do |format|
      if @post_resource.save
        flash[:notice] = 'PostResource was successfully created.'
        format.html { redirect_to(['admin', @post_resource]) }
        format.xml  { render :xml => @post_resource, :status => :created, :location => ['admin', @post_resource] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/post_resources/1
  # PUT /admin/post_resources/1.xml
  def update
    @post_resource = PostResource.find(params[:id])

    respond_to do |format|
      if @post_resource.update_attributes(params[:post_resource])
        flash[:notice] = 'PostResource was successfully updated.'
        format.html { redirect_to(['admin', @post_resource]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_resources/1
  # DELETE /admin/post_resources/1.xml
  def destroy
    @post_resource = PostResource.find(params[:id])
    @post_resource.destroy

    respond_to do |format|
      format.html { redirect_to(admin_post_resources_url) }
      format.xml  { head :ok }
    end
  end
end
