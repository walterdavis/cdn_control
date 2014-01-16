class LibrariesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource
  def index
    @libraries = Library.order(:name)
  end
  def show
    @library = Library.find(params[:id])
  end
  def new
    @library = current_user.libraries.build
  end
  def create
    @library = current_user.libraries.build(params[:library])
    if(@library.save)
      redirect_to @library, :notice => 'Library created'
    else
      render :action => 'new'
    end
  end
  def edit
    #@library = current_user.libraries.find(params[:id])
  end
  def update
    #@library = current_user.libraries.find(params[:id])
    if @library.update_attributes(params[:library])
      redirect_to @library, :notice  => "Updated library"
    else
      render :action => 'edit'
    end
  end
  def destroy
    @library = current_user.libraries.find(params[:id])
    @library.destroy
    redirect_to libraries_url, :notice => 'Library deleted'
  end
end
