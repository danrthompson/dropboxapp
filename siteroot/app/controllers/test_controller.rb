class TestController < ApplicationController
  def uploading_files
  	@resources = Resource.all
  	@new_resource = Resource.new
  end

  def uploading_files_post
  end

  def sample_display_page
  	@page = Page.find_by_id(1)
  end
end
