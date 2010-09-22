class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
    #
    # this is the only change we need in this controller
    # it will allow us to iterate the comment that belong
    # to an specific @article, because we are scoping it
    # and thank to the awesome nested set gem it will only
    # show the comments that have parent_id = nil, this here
    # refers to the second association that was made, the self
    # referencial association, and root are the comment wich
    # dont belong to any other comment.
    #
    @comments = @article.comments.roots.order("created_at DESC").paginate( :page => params[:page]||1,:per_page => 5)

    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to @article
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to @article
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end
