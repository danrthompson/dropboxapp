class Page < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :resources, dependent: :destroy
  belongs_to :db_user
end
