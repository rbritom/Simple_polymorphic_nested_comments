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
    # will_paginate: will paginate is very simple it uses and
    # offset and a size to pull items in groups. The parameter page
    # is used to calculate the current offset, for example, lets say
    # you have this items [1,2,3,4,5,6,7,8,9], you can pull groups of
    # numbers out of it by specifying the size and the offset.
    #
    # Lets say size is 3, the first pull would be , offset= 0 with size = 3
    # and you would get [1,2,3], the second pull is , offset= size with size =3,
    # this would return [4,5,6], the third pull would be , offset = size*2 with
    # size = 3 and you would get [7,8,9], so at the end we have something like
    # this, offset = size*(page-1). In will_paginate the size is called per_page.
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
