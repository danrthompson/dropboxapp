class FileSection < ActiveRecord::Base
  attr_accessible :page_id, :rank, :title

  belongs_to :page

  validates :page_id, :rank, :title, presence: true
end
