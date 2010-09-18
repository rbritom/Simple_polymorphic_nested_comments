class ProyectsController < ApplicationController
  def index
    @proyects = Proyect.all
  end
  
  def show
    @proyect = Proyect.find(params[:id])
    @comments = @article.comments
  end
  
  def new
    @proyect = Proyect.new
  end
  
  def create
    @proyect = Proyect.new(params[:proyect])
    if @proyect.save
      flash[:notice] = "Successfully created proyect."
      redirect_to @proyect
    else
      render :action => 'new'
    end
  end
  
  def edit
    @proyect = Proyect.find(params[:id])
  end
  
  def update
    @proyect = Proyect.find(params[:id])
    if @proyect.update_attributes(params[:proyect])
      flash[:notice] = "Successfully updated proyect."
      redirect_to @proyect
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @proyect = Proyect.find(params[:id])
    @proyect.destroy
    flash[:notice] = "Successfully destroyed proyect."
    redirect_to proyects_url
  end
end
