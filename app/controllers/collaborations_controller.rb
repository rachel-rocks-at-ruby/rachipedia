class CollaborationsController < ApplicationController

  def new
    @collaboration = Collaboration.new
    @user = current_user
  end

  def create
    @collaboration = Collaboration.new(params[:collaboration].permit!)
    
    if @collaboration.save
      redirect_to wikis_path, notice: "Wiki shared."
    else
      flash[:error] = "Error creating wiki. Try again."
      render :new
    end
  end

  def show
    @collaboration = Collaboration.find(params[:wiki])
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id]) 
    @collaboration = Collaboration.find(params[:id])
    @collaboration.destroy
    flash[:notice] = "Collaboration successfully deleted."
    redirect_to wikis_path
  end

end
