class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.search(params[:comment_search]).recent.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

 

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new(:parent_id => params[:parent_id],:book_id => params[:book_id], :user => current_user)
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
 
  def create 
    @comment = current_user.comments.build(params[:comment])
    @comment.request = request
    @comment.save 
     respond_to do |format|
       format.html do
         if @comment.errors.present?
           render :new
         else
           @comment.notify_other_commenters
           redirect_to(book_path(@comment.book, :view => "comments"))
         end
       end
      end 
       #format.js 
     end
   
  
  
  def update
    @comment.update_attributes(params[:comment])
    respond_to do |format|
      format.html do
        if @comment.errors.present?
          render :edit
        else
          redirect_to(book_path(@comment.book, :view => "comments"))
        end
      end
      format.js
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Deleted comment. #{undo_link}"
    respond_to do |format|
      format.html { redirect_to book_path(@comment.book, :view => "comments") }
      format.js
    end
  end

  private

  def undo_link
    if can? :revert, :versions
      version = @comment.versions.scoped.last
      view_context.link_to("undo", revert_version_path(version), :method => :post) if can? :revert, version
    end
  end

  # # PUT /comments/1
  # # PUT /comments/1.xml
  # def update
    # @comment = Comment.find(params[:id])
# 
    # respond_to do |format|
      # if @comment.update_attributes(params[:comment])
        # format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        # format.xml  { head :ok }
      # else
        # format.html { render :action => "edit" }
        # format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      # end
    # end
  # end
# 
  # # DELETE /comments/1
  # # DELETE /comments/1.xml
  # def destroy
    # @comment = Comment.find(params[:id])
    # @comment.destroy
# 
    # respond_to do |format|
      # format.html { redirect_to(comments_url) }
      # format.xml  { head :ok }
    # end
  # end
end
