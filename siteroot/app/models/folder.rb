class Folder < ActiveRecord::Base
  attr_accessible :depth, :label, :order, :page_id, :folder_id

  has_many :children_folders, class_name: "Folder", foreign_key: "parent_folder_id"
  has_many :resources

  belongs_to :parent_folder, class_name: "Folder"
  belongs_to :page

end
