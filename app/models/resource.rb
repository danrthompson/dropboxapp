class Resource < ActiveRecord::Base
  attr_accessible :description, :title, :resource_file

  belongs_to :page

  has_attached_file :resource_file
end
