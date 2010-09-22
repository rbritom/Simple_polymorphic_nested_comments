class CommentsController < ApplicationController

  #
  # since comments are always deplayed from inside their
  # parent's show action , none of the actions that have
  # templates are created. (index, show, new or edit)
  ##

  def create
    # Read the context_object first.
    #
    # The context_objct method end up returning
    # Article.find(5) or Proyect.find(6), depending on
    # what the context_type and the parent_id are in the
    # params hash. So it returns an specific record one that
    # will be the parent in the create action.
    #
    @commentable= context_object()

    #
    # We scope the build method so that rails will automaticly fill
    # the commentable_type and commentable_id values on the comments
    # table. Remember that commentable was the alias used for article
    # and proyect in the models.
    #
    # That is all you need to create a comment inside the correspongin parent
    #
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      respond_to do |format|
       format.js
       format.html{ redirect_to @commentable}
      end
    else
      render :action => 'new'
    end
  end
  
 
  def update
    #
    # Read create first
    #
    # The only mayor diference between this and the create
    # action is that this time im passing ad include option,
    # all this does is tell active record that when it fetches
    # the article or proyect it should also fetch its comments
    # in the same query. The include option is passed to the
    # context_object option who them recives it as  finder_options
    # and uses in in the find
    #
    @commentable= context_object.includes(:comments)
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to @commentable
    else
      render :action => 'edit'
    end
  end

  
  # there is no need to scope the comment user the @commentable
  # instance and the context_type since we are going to
  # find the comment by its id which is an unique value in the database.
  #
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    # :back is an alias to env[:HTTP_REFERER]
    # and holds the page that sent us to this action
    # redirecting to :back  saves us having from to
    # use context_object to figure out how to
    # redirect to the parent
    #
    redirect_to :back
  end


  private

   # this function here is the reason why :constraint => {:context_type => "articles"} was added to
   # routes file, everytime the params hash comes from withing the comments nested path, the router adds
   # the context type to the params hash, so i access that value by reading from params hash and
   # accessing the inner value  params[:constraint] out of which [:context_type] is one, and you can pull
   # the value of a hash inside a hash the way you pull the value of a nested array.  In each context the value is
   # returned telling if am accesing comments from inside the articles or the proyects, so those are the 2 values i can get
   # but they are only strings, and are in plural, so i make it singular with singularize and make them constants with
   # contantize, that way the values become Article and Proyect, the name of the models! so now they are model
   # names and i call find on them, but i still need the to pass an id to the find,so how do i get the id ? look lower
   # at the context_id method.
   #
   # *finder_options just passes down any option pass to the context_object method and uses it in the find
   # you will see wa  this does when you read the update action.
   #
  def context_object
    params[:constraint][:context_type].singularize.classify.constantize.find( context_id )
  end

  # this here is the action the gets the id of the parent model of the polymorphic association, just as the previous
  # method is catches where is the the comments action been called and uses that to build a parent_id symbol and then
  # uses that to get the value out of the params hash, becuase the params hash also carries this value it the path
  # /articles/:article_id/comments  or /articles/:proyect_id/comments passed by the route and extracts the corresponding
  # id of the parent in the given path, so what im doing at the end, is using context_type to build the param
  # :article_id  or :proyect_id depending on the case and then using that symbol to get the proper params[:article_id] or
  # params[:proyect_id]

  def context_id
    params["#{ params[:constraint][:context_type].singularize }_id"]
  end



end
