Treadedcomments::Application.routes.draw do
  # first we remove the this
  # resources :comments as we want this routes to be nested
  # it will make this easier when we want to find who is the parent
  # of the comment
  #
  
  
  # resources: is a helper that creates 7 routes, with the help of http methods we can destiguish the
  # action we want to access with a giveng route.
  #
  #    This route with  method get is used to call a collection of articles with the index action
  #        articles GET    /articles(.:format)                          {:action=>"index", :controller=>"articles"}
  #        
  #    This route with  method post  is used to create an article with the create action   
  #        articles POST   /articles(.:format)                          {:action=>"create", :controller=>"articles"}
  #        
  #     This route with  method get  is used to call the 'new' template and render an empty
  #     intance of the article in a form, this is to give the visitor a visial interface, new
  #     does not create articles, the create action does that, that is why new is accessed
  #     with method get not post or put
  #     new_article GET    /articles/new(.:format)                      {:action=>"new", :controller=>"articles"}
  #     
  #     This route with method get and passing and id is also a for renderina template with a form
  #     just like the new route/action/view i does no creates anything, but it does need an id 
  #     to fetch from the database the values of the article to edit and fill the form with them 
  #    edit_article GET    /articles/:id/edit(.:format)                 {:action=>"edit", :controller=>"articles"}
  #    
  #     this route with method get and passing and id  is the for readind single element, so you need to pass an
  #     id to be able to fetch that element from the database
  #         article GET    /articles/:id(.:format)                      {:action=>"show", :controller=>"articles"}
  #         
  #     this routes with method put is the complement of the edit action, work like the create action, but instead 
  #     of creating an object it updates one, note that create does not require an id to be passed because there
  #     the object is new.    
  #         article PUT    /articles/:id(.:format)                      {:action=>"update", :controller=>"articles"}
  #         
  #     this route  with methid delete and an id is for finding a single resource and deleting is, usually has no template 
  #         article DELETE /articles/:id(.:format)                      {:action=>"destroy", :controller=>"articles"}
  #
  #     this mapping of GET, PUT, POST and  DELETE to operation on the records of the database is called
  #     Reprentationla State Transfer, REST.
  #
  #
  #
  resources :articles do


    # Here we are nesting the comments routes so that they look like this
    #
    # /articles/:article_id/comments
    # 
    # this will later let us find out easy the article to which a comment
    # belongs to, also make sense since comments will be shown at the bottom of
    # the articles show page.
    #
    #  :only => [:create, :update,:destroy]  tell the rource helper we only want those
    #  routes to be created for comments, i also deleted they corresponding view, why ?
    #  because we will always access comment from the parents  show template.
    #  We will create the comments at the articles show page so the new action is not
    #  needed, same thing with the index and edit views/actions
    #
    #  :constraint => {:context_type => "articles"} we are asking for a contraing to be added
    #  to this routes and spceify a context_type, this will be passed to the params hash when
    #  ever we access comments giving us a hint of who the commmetable alias represent in each case
    ##
    resources :comments, :only => [:create, :update,:destroy], :constraint => {:context_type => "articles"}
  end
  resources :proyects do
    resources :comments, :only => [:create, :update,:destroy], :constraint => {:context_type => "proyects"}
  end

 

  
end
