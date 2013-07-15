class Page < ActiveRecord::Base
  attr_accessible :description, :title, :resources_header, :resources_description, :db_user_id

  has_many :resources, dependent: :destroy
  has_many :folders, dependent: :destroy

  belongs_to :db_user

  def root_folders
  	Folder.where({page_id: self.id, depth: 0})
  end
end
