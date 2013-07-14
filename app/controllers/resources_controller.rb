class ResourcesController < ApplicationController
  def create
  	Resource.create(params[:resource])
  	redirect_to :back
  end

  def show
  end

  def update
  end

  def destroy
  end
end
