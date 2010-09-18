class CommentsController < ApplicationController

  
  def create
    @commentable= context_object( :include => :comments )
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @commentable
    else
      render :action => 'new'
    end
  end
  
 
  def update
    @commentable= context_object( :include => :comments )
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @commentable
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end


  private


  def context_object( *finder_options )
    params[:constraint][:context_type].singularize.classify.constantize.find( context_id, *finder_options )
  end

  def context_id
    params["#{ params[:constraint][:context_type].singularize }_id"]
  end



end
