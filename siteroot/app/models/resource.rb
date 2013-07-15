class Resource < ActiveRecord::Base
  attr_accessible :description, :title, :resource_file, :page_id, :folder_id

  belongs_to :page
  belongs_to :folder

  has_attached_file :resource_file

  include Rails.application.routes.url_helpers

  def to_jq_resource_file
    {
      "name" => read_attribute(:resource_file_file_name),
      "size" => read_attribute(:resource_file_file_size),
      "url" => resource_file.url(:original),
      "delete_url" => resource_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
