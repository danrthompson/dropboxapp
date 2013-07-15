class ResourcesController < ApplicationController
  def create
    @resource = Resource.create(params[:resource])

    respond_to do |format|
      if @resource.save
        format.html {
          render :json => [@resource.to_jq_resource_file].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@resource.to_jq_resource_file]}, status: :created, location: @resource }
      else
        format.html { render text: "fail" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def update
  end

  def destroy
  end
end
