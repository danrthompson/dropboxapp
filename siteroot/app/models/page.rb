class Page < ActiveRecord::Base
  attr_accessible :description, :title, :resources_header, :resources_description, :db_user_id, :main_image

  has_many :resources, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_attached_file :main_image

  belongs_to :db_user

  def root_folders
  	Folder.where({page_id: self.id, depth: 0})
  end


  include Rails.application.routes.url_helpers

  def to_jq_main_image
    {
      "name" => read_attribute(:main_image_file_name),
      "size" => read_attribute(:main_image_file_size),
      "url" => main_image.url(:original),
      "delete_url" => resource_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
