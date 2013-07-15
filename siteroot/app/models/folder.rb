class Folder < ActiveRecord::Base
  attr_accessible :depth, :label, :order, :page_id, :folder_id

  has_many :folders
  has_many :resources

  belongs_to :folder
  belongs_to :page

end
