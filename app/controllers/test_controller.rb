class TestController < ApplicationController
  def uploading_files
  	@resources = Resource.all
  	@new_resource = Resource.new
  end

  def uploading_files_post
  end
end
